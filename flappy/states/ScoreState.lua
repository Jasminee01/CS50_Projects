--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

-- New code
 -- two variabels one to keep track of weather the user won a medal 
 local medalWon = nil  
-- and the other to keep track of the type of medal the user won
 local medal = nil   

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score

    -- New Code to load the medals onto the screen
    self.gold = love.graphics.newImage('gold.png')
    self.silver = love.graphics.newImage('silver.png')
    self.bronze = love.graphics.newImage('bronze.png')

end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 110, VIRTUAL_WIDTH, 'center')
   
    if self.score > 21 then 
        medalWon = self.gold
        medal = 'Gold'
    elseif self.score > 11 then 
        medalWon = self.silver
        medal = 'Silver'
    elseif self.score > 5 then 
        medalWon = self.silver
        medal = 'Bronze'
    end 
    medalWon = self.gold
    medal = 'Gold'

    -- if medalWon ~= null then 
        love.graphics.printf('You have won a ' .. medal .. ' medal!', 0 , 90 , VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medalWon, 0, 0, 0, 0.05, 0.05)
     
    -- else
    --     love.graphics.setFont(flappyFont)
    --     love.graphics.printf('Oof.. You suck!', 0, 60, VIRTUAL_WIDTH, 'center')
    -- end 

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
   
end