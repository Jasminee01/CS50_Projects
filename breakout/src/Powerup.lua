--[[ 
    -- Powerup Class
]]

Powerup = Class{}
-- Initialize the Powerup object with type, x, and y coordinates
function Powerup:init(powertype, x, y)
      -- Set the dimensions of the Powerup object
     self.width = 16
     self.height = 16

     -- Set the initial velocity of the Powerup
     self.dy = 40
     self.dx = 0

     -- Set the initial position of the Powerup
     self.x = x
     self.y = y

     -- Store the type of powerup
     self.powertype = powertype
     -- Indicate that the Powerup is in play
     self.inplay = true
end

-- Check for collisions between the Powerup and a target object
function Powerup:collides(target)
     -- Check if there is no horizontal overlap between Powerup and target
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
 -- Check if there is no vertical overlap between Powerup and target
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 
-- If there is overlap in both horizontal and vertical dimensions, a collision occurred
    return true
end


function Powerup:update(dt)
      -- Move the Powerup downward as long as it's within the screen bounds
    if self.y < VIRTUAL_HEIGHT then
        self.y = self.y + self.dy * dt
    end
end

-- Render the Powerup object on the screen
function Powerup:render()
    if self.inplay then
          -- Draw the Powerup using a specific texture and frame based on its type
        love.graphics.draw(gTextures['main'], gFrames['power'][self.powertype], self.x, self.y)
    end
end