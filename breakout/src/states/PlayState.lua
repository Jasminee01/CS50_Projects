 --[[
    GD50
    Breakout Remake
    -- PlayState Class --
    Author: Colton Ogden
    cogden@cs50.harvard.edu
    Represents the state of the game in which we are actively playing;
    player should control the paddle, with the ball actively bouncing between
    the bricks, walls, and the paddle. If the ball goes below the paddle, then
    the player should lose one point of health and be taken either to the Game
    Over screen if at 0 health or the Serve screen otherwise.
]]

PlayState = Class{__includes = BaseState}

--[[
    We initialize what's in our PlayState via a state table that we pass between
    states as we go from playing to serving.
]]
function PlayState:enter(params)
    self.paddle = params.paddle
    self.bricks = params.bricks
    self.health = params.health
    self.score = params.score
    self.highScores = params.highScores

    local brick
    
    -- allow more than one ball
    self.balls = {params.ball}
    self.numBalls = 1

    self.level = params.level
    self.recoverPoints = 5000

    -- give ball random starting velocity
    self.balls[1].dx = math.random(-200, 200)
    self.balls[1].dy = math.random(-50, -60)

    
--    NEWCOCE:
    -- Initialize the player's powerups as an empty table
    self.powerups = {}
    -- Initialize a flag to represent whether the player has a key
    self.key = false
    -- Initialize a flag to represent whether the player can break locks
    self.canBreakLocks = false
    -- Initialize a counter for the number of locked bricks
    self.numLockedBricks = 0

    -- Loop through each brick in the level
    -- If the brick is locked, increment the count of locked bricks
    for k, brick in pairs(self.bricks) do
        if brick.isLocked then
            self.numLockedBricks = self.numLockedBricks + 1
        end
    end

end

function PlayState:update(dt)

    if self.paused then
        if love.keyboard.wasPressed('space') then
            self.paused = false
            gSounds['pause']:play()
        else
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.paused = true
        gSounds['pause']:play()
        return
    end

    -- update paddle position
    self.paddle:update(dt)

     
    -- update multiple balls
    for k, ball in pairs(self.balls) do 

        ball:update(dt)
     
        if ball:collides(self.paddle) then
            -- raise ball above paddle in case it goes below it, then reverse dy
            ball.y = self.paddle.y - 8
            ball.dy = -ball.dy

            --
            -- tweak angle of bounce based on where it hits the paddle
            --

            -- if we hit the paddle on its left side while moving left...
            if ball.x < self.paddle.x + (self.paddle.width / 2) and self.paddle.dx < 0 then
                ball.dx = -50 + -(8 * (self.paddle.x + self.paddle.width / 2 - ball.x))
            
            -- else if we hit the paddle on its right side while moving right...
            elseif ball.x > self.paddle.x + (self.paddle.width / 2) and self.paddle.dx > 0 then
                ball.dx = 50 + (8 * math.abs(self.paddle.x + self.paddle.width / 2 - ball.x))
            end
            gSounds['paddle-hit']:play()
        end
    
        -- detect collision across all bricks with the ball
        for k, brick in pairs(self.bricks) do

            -- only check collision if we're in play
            if brick.inPlay and ball:collides(brick) then

                -- NEWCODE: 
                -- Check if the player has a key and the brick is locked
                if self.key and brick.locked then
                     -- If the player has a key and the brick is locked, award 5000 points
                    self.score = self.score + 5000
                elseif brick.locked then
                    -- If the brick is locked but the player doesn't have a key, do not give points
                else 
                    -- If the brick is not locked, calculate and award points based on tier and color
                    self.score = self.score + (brick.tier * 200 + brick.color * 25)
                end
                -- Call the 'hit' method of the brick, passing the key as an argument
                brick:hit(self.key)

               -- Check if the player has earned enough points to recover a point of healthl
                if self.score > self.recoverPoints then
                   -- Ensure the player's health doesn't exceed the maximum of 3
                    self.health = math.min(3, self.health + 1)

                    -- Multiply the recover points threshold by 2 for the next health recovery
                    self.recoverPoints = math.min(100000, self.recoverPoints * 2)

                     -- Increase the size of the paddle, but only if it's smaller than the max size 
                    if self.paddle.size < 4 then
                      self.paddle:grow()
                    end

                    -- play recover sound effect
                    gSounds['recover']:play()
                end

                 -- NEW CODE:
                --  20% chance of getting a powerup when hitting a brick
                if math.random(100) < 20 then  
                    -- Decide whether it's a key powerup or a random powerup (75% random, 25% key)
                    if math.random(4) > 2 then 
                        if self.numLockedBricks >0  then
                        powertype = 9 -- key powerup
                        end 
                    else
                        powertype = 8 -- 3 ball powerup
                    end
                    -- Create a new powerup object with the selected type and place it at the ball's position
                    pwr = Powerup(powertype, ball.x, ball.y)
                    -- Add the powerup to the list of active powerups
                    table.insert(self.powerups, pwr)
                end

                -- go to our victory screen if there are no more bricks left
                if self:checkVictory() then
                    gSounds['victory']:play()

                    gStateMachine:change('victory', {
                        level = self.level,
                        paddle = self.paddle,
                        health = self.health,
                        score = self.score,
                        highScores = self.highScores,
                        ball = ball,
                        recoverPoints = self.recoverPoints
                    })
                end
                --
                -- collision code for bricks
                --
                -- we check to see if the opposite side of our velocity is outside of the brick;
                -- if it is, we trigger a collision on that side. else we're within the X + width of
                -- the brick and should check to see if the top or bottom edge is outside of the brick,
                -- colliding on the top or bottom accordingly 
                --

                -- left edge; only check if we're moving right, and offset the check by a couple of pixels
                -- so that flush corner hits register as Y flips, not X flips
                if ball.x + 2 < brick.x and ball.dx > 0 then
                    
                    -- flip x velocity and reset position outside of brick
                    ball.dx = -ball.dx
                    ball.x = brick.x - 8
                
                -- right edge; only check if we're moving left, , and offset the check by a couple of pixels
                -- so that flush corner hits register as Y flips, not X flips
                elseif ball.x + 6 > brick.x + brick.width and ball.dx < 0 then
                    
                    -- flip x velocity and reset position outside of brick
                    ball.dx = -ball.dx
                    ball.x = brick.x + 32
                
                -- top edge if no X collisions, always check
                elseif ball.y < brick.y then
                    
                    -- flip y velocity and reset position outside of brick
                    ball.dy = -ball.dy
                    ball.y = brick.y - 8
                
                -- bottom edge if no X collisions or top collision, last possibility
                else
                    
                    -- flip y velocity and reset position outside of brick
                    ball.dy = -ball.dy
                    ball.y = brick.y + 16
                end

                -- slightly scale the y velocity to speed up the game, capping at +- 150
                if math.abs(ball.dy) < 150 then
                    ball.dy = ball.dy * 1.02
                end

                -- only allow colliding with one brick, for corners
                break
            end
        end
       
        -- NEW CODE:
        -- Iterate through the list of active powerups
        for k, powerup in pairs(self.powerups) do
            powerup:update(dt)
            -- Check if the powerup collides with the paddle
            if powerup and powerup:collides(self.paddle) then
                 -- Check the type of the powerup
                if powerup.powertype == 8 then
                    -- Activate the bonus balls powerup
                    self:bonusBalls()  
                end       
                if powerup.powertype == 9 then
                    -- Activate the key powerup and display the icon on the top right
                    self.key = true
                    renderKeyPowerup()
                end  
                -- Remove the collided powerup from the list
                table.remove(self.powerups, k)
            end
             -- Remove powerup from the list when it goes off the screen
            if powerup.y > VIRTUAL_HEIGHT +16 then
                table.remove(self.powerups, k)
            end
        end

        -- if ball goes below bounds, revert to serve state and decrease health
        if ball.y >= VIRTUAL_HEIGHT then
            if self.numBalls <= 1 then 
                self.health = self.health - 1
                
                 -- NEW CODE:
                if self.paddle.size > 1 then
                     -- If the paddle's size is greater than 1, shrink it
                    self.paddle:shrink()
                end

                if self.health == 0 then
                    gStateMachine:change('game-over', {
                        score = self.score,
                        highScores = self.highScores
                    })
                else
                        gStateMachine:change('serve', {
                        paddle = self.paddle,
                        bricks = self.bricks,
                        health = self.health,
                        score = self.score,
                        highScores = self.highScores,
                        level = self.level,
                        recoverPoints = self.recoverPoints
                    })
                end
            else
                table.remove( self.balls, k )
                self.numBalls = self.numBalls - 1
            end
        end
    end

    -- for rendering particle systems
    for k, brick in pairs(self.bricks) do
        brick:update(dt)
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function PlayState:render()
    -- render bricks
    for k, brick in pairs(self.bricks) do
        brick:render()
    end

    -- render all particle systems
    for k, brick in pairs(self.bricks) do
        brick:renderParticles()
    end

    self.paddle:render()

    for k, ball in pairs(self.balls) do
        ball:render()
    end

    if powertype == 8 or powertype == 9 then 
        for k, powerup in pairs(self.powerups) do
            powerup:render()
        end
    end 

    renderScore(self.score)
    renderHealth(self.health)

    -- Show key symbol if player has key powerup
    if self.key then
        love.graphics.draw(gTextures['main'], gFrames['power'][9],VIRTUAL_WIDTH - 116, 3, 0, 0.6)
    end

    -- pause text, if paused
    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    end
end

function PlayState:checkVictory()
    for k, brick in pairs(self.bricks) do
        if brick.inPlay then
            return false
        end 
    end

    return true
end

-- NEWCODE:
function PlayState:bonusBalls()
    -- Create bonus balls if there's only one ball in play
    if self.numBalls == 1 then
        -- Create two additional balls with random starting directions
        ball2 = Ball(math.random(7))
        ball3 = Ball(math.random(7))
        -- Position the new balls near the center of the screen
        ball2.x = VIRTUAL_WIDTH / 2 - 8
        ball2.y = VIRTUAL_HEIGHT / 2 - 8
        ball2.dx = self.balls[1].dx
        ball2.dy = self.balls[1].dy

        ball3.x = VIRTUAL_WIDTH / 2 - 8
        ball3.y = VIRTUAL_HEIGHT / 2 - 8
        ball3.dx = - self.balls[1].dx
        ball3.dy = - self.balls[1].dy
        -- Add the new balls to the list of active balls
        table.insert(self.balls, ball2)
        table.insert(self.balls, ball3)

        -- Update the count of active balls to 3
        self.numBalls = 3
    end
end