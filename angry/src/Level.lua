--[[
    GD50
    Angry Birds

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Level = Class{}

function Level:init()
    
    -- create a new "world" (where physics take place), with no x gravity
    -- and 30 units of Y gravity (for downward force)
    self.world = love.physics.newWorld(0, 300)

    -- bodies we will destroy after the world update cycle; destroying these in the
    -- actual collision callbacks can cause stack overflow and other errors
    self.destroyedBodies = {}

    self.playerHadContact = false

    -- define collision callbacks for our world; the World object expects four,
    -- one for different stages of any given collision
    function beginContact(a, b, coll)
        local types = {}
        types[a:getUserData()] = true
        types[b:getUserData()] = true
        -- NEWCODE
        if types['Player'] then 
            self.playerHadContact = true 
        end 


        -- if we collided between both the player and an obstacle...
        if types['Obstacle'] and types['Player'] then

            if a:getUserData() == 'Obstacle' then 
                -- grab the body that belongs to the player
                local velX, velY = b:getBody():getLinearVelocity()
                local sumVel = math.abs(velX) + math.abs(velY)

                if sumVel > 20 then
                    table.insert(self.destroyedBodies, b:getBody())
                end
            else 
                -- destroy the obstacle if player's combined X/Y velocity is high enough
                local velX, velY = a:getBody():getLinearVelocity()
                local sumVel = math.abs(velX) + math.abs(velY)

                if sumVel > 20 then
                    table.insert(self.destroyedBodies, b:getBody())
                end
            end 
        end

        -- if we collided between an obstacle and an alien, as by debris falling...
        if types['Obstacle'] and types['Alien'] then

            -- destroy the alien if falling debris is falling fast enough
            if a:getUserData() == 'Obstacle' then 
                local velX, velY = a:getBody():getLinearVelocity()
                local sumVel = math.abs(velX) + math.abs(velY)

                if sumVel > 20 then 
                    table.insert(self.destroyedBodies, b:getBody())
                end 
            else 
                local velX, velY = b:getBody():getLinearVelocity()
                local sumVel = math.abs(velX) + math.abs(velY)

                if sumVel > 20 then
                    table.insert(self.destroyedBodies, a:getBody())
                end
            end 
        end

        -- if we collided between the player and the alien...
        if types['Player'] and types['Alien'] then

            -- destroy the alien if falling debris is falling fast enough
            if a:getUserData() == 'Obstacle' then 
                local velX, velY = a:getBody():getLinearVelocity()
                local sumVel = math.abs(velX) + math.abs(velY)

                if sumVel > 30 then 
                    table.insert(self.destroyedBodies, b:getBody())
                end 
            else 
                local velX, velY = b:getBody():getLinearVelocity()
                local sumVel = math.abs(velX) + math.abs(velY)

                if sumVel > 20 then
                    table.insert(self.destroyedBodies, a:getBody())
                end
            end 
        end

        -- if we hit the ground, play a bounce sound
        if types['Player'] and types['Ground'] then
            gSounds['bounce']:stop()
            gSounds['bounce']:play()
        end
    end

    -- the remaining three functions here are sample definitions, but we are not
    -- implementing any functionality with them in this demo; use-case specific
    -- http://www.iforce2d.net/b2dtut/collision-anatomy
    function endContact(a, b, coll)
        
    end

    function preSolve(a, b, coll)

    end

    function postSolve(a, b, coll, normalImpulse, tangentImpulse)

    end

    -- register just-defined functions as collision callbacks for world
    self.world:setCallbacks(beginContact, endContact, preSolve, postSolve)

    -- shows alien before being launched and its trajectory arrow
    self.launchMarker = AlienLaunchMarker(self.world)

    -- aliens in our scene
    self.aliens = {}

    -- obstacles guarding aliens that we can destroy
    self.obstacles = {}

    -- simple edge shape to represent collision for ground
    self.edgeShape = love.physics.newEdgeShape(0, 0, VIRTUAL_WIDTH * 3, 0)

    -- spawn an alien to try and destroy
    table.insert(self.aliens, Alien(self.world, 'square', VIRTUAL_WIDTH - 80, VIRTUAL_HEIGHT - TILE_SIZE - ALIEN_SIZE / 2, 'Alien'))

    -- spawn a few obstacles
    table.insert(self.obstacles, Obstacle(self.world, 'vertical',
        VIRTUAL_WIDTH - 120, VIRTUAL_HEIGHT - 35 - 110 / 2))
    table.insert(self.obstacles, Obstacle(self.world, 'vertical',
        VIRTUAL_WIDTH - 35, VIRTUAL_HEIGHT - 35 - 110 / 2))
    table.insert(self.obstacles, Obstacle(self.world, 'horizontal',
        VIRTUAL_WIDTH - 80, VIRTUAL_HEIGHT - 35 - 110 - 35 / 2))

    -- ground data
    self.groundBody = love.physics.newBody(self.world, -VIRTUAL_WIDTH, VIRTUAL_HEIGHT - 35, 'static')
    self.groundFixture = love.physics.newFixture(self.groundBody, self.edgeShape)
    self.groundFixture:setFriction(0.5)
    self.groundFixture:setUserData('Ground')

    -- background graphics
    self.background = Background()
end

function Level:update(dt)
    
    -- update launch marker, which shows trajectory
    self.launchMarker:update(dt)

    -- Box2D world update code; resolves collisions and processes callbacks
    self.world:update(dt)

    -- destroy all bodies we calculated to destroy during the update call
    for k, body in pairs(self.destroyedBodies) do
        if not body:isDestroyed() then 
            body:destroy()
        end
    end

    -- reset destroyed bodies to empty table for next update phase
    self.destroyedBodies = {}

    -- remove all destroyed obstacles from level
    for i = #self.obstacles, 1, -1 do
        if self.obstacles[i].body:isDestroyed() then
            table.remove(self.obstacles, i)

            -- play random wood sound effect
            local soundNum = math.random(5)
            gSounds['break' .. tostring(soundNum)]:stop()
            gSounds['break' .. tostring(soundNum)]:play()
        end
    end

    -- remove all destroyed aliens from level
    for i = #self.aliens, 1, -1 do
        if self.aliens[i].body:isDestroyed() then
            table.remove(self.aliens, i)
            gSounds['kill']:stop()
            gSounds['kill']:play()
        end
    end

    -- replace launch marker if original alien stopped moving
    if self.launchMarker.launched then
        -- NEWCODE
        -- Check if the 'Space' key is pressed and the player hasn't made contact with an object
        if love.keyboard.wasPressed('space') and not self.playerHadContact then 
            -- Get the position and linear velocity of the main alien in the launch marker
            for k, yVelModifier in pairs({80,-80}) do 
                local xPosMain, yPosMain = self.launchMarker.aliens[1].body:getPosition()
                local xVelMain, yVelMain = self.launchMarker.aliens[1].body:getLinearVelocity()
                -- Set the linear velocity of the new alien with a modified y-velocity
                local alien = Alien(self.world, 'round', xPosMain, yPosMain, 'Player')

                alien.body:setLinearVelocity(xVelMain + 10, yVelMain + yVelModifier)
                -- Set restitution and angular damping for the new alien
                alien.fixture:setRestitution(0.4)
                alien.body:setAngularDamping(1)
                -- Add the new alien to the launch marker's aliens table
                table.insert(self.launchMarker.aliens, alien)
            
            end 
        end

        for i = #self.launchMarker.aliens,1,-1 do 
            local alien = self.launchMarker.aliens[i]
            -- Check if the alien's body is not destroyed
            if not alien.body:isDestroyed() then 
                local xPos, yPos = alien.body:getPosition()
                local xVel, yVel = alien.body:getLinearVelocity()

                -- Check if the alien is out of bounds 
                if xPos < 0 or xPos > VIRTUAL_WIDTH + ALIEN_SIZE or ( math.abs(xVel) + math.abs(yVel) < 1.5) then 
                    alien.body:destroy()
                end 
            else 
                -- Remove the alien from the launch marker's aliens table if its body is destroyed
                table.remove(self.launchMarker.aliens, i)
            end 
        end 
        -- Check if there are no more aliens left in the launch marker
        if #self.launchMarker.aliens == 0 then 
            self.launchMarker = AlienLaunchMarker(self.world)
            self.playerHadContact = false 
            -- Check if there are no more aliens in the game
            if #self.aliens == 0 then 
                 -- Change the game state to 'start'
                gStateMachine:change('start')
            end 
        end  
    end
end

function Level:render()
    
    -- render ground tiles across full scrollable width of the screen
    for x = -VIRTUAL_WIDTH, VIRTUAL_WIDTH * 2, 35 do
        love.graphics.draw(gTextures['tiles'], gFrames['tiles'][12], x, VIRTUAL_HEIGHT - 35)
    end

    self.launchMarker:render()

    for k, alien in pairs(self.aliens) do
        alien:render()
    end

    for k, obstacle in pairs(self.obstacles) do
        obstacle:render()
    end

    -- render instruction text if we haven't launched bird
    if not self.launchMarker.launched then
        love.graphics.setFont(gFonts['medium'])
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.printf('Click and drag circular alien to shoot!',
            0, 64, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)
    end

    -- render victory text if all aliens are dead
    if #self.aliens == 0 then
        love.graphics.setFont(gFonts['huge'])
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.printf('VICTORY', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)
    end
end