--[[
    GD50
    Match-3 Remake

    -- Board Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The Board is our arrangement of Tiles with which we must try to find matching
    sets of three horizontally or vertically.
]]

Board = Class{}

function Board:init(x, y, level)
    self.x = x
    self.y = y
    self.matches = {}
    self.level = level

    -- NEW CODE
    -- number of colors
    self.numColors = math.min(10, self.level + 5) 
    self.dColors = self:getRandColor(self.numColors)
    -- maximum variety
    self.maxVar = math.min(6, self.level)
    -- 
    self:initializeTiles()
end

function Board:initializeTiles()
    self.tiles = {}

    for tileY = 1, 8 do

        -- empty table that will serve as a new row
        table.insert(self.tiles, {})

        for tileX = 1, 8 do
            local var = (math.random(6) == 1) and math.min(self.maxVar, math.random(2,6)) or 1
            -- create a new tile at X,Y with a random color and variety
            table.insert(self.tiles[tileY], Tile(tileX, tileY, self.dColors[math.random(self.numColors)], var))
        end
    end

    while self:calculateMatches() do

        -- recursively initialize if matches were returned so we always have
        -- a matchless board on start
        self:initializeTiles()
    end
end

--[[
    Goes left to right, top to bottom in the board, calculating matches by counting consecutive
    tiles of the same color. Doesn't need to check the last tile in every row or column if the
    last two haven't been a match.
]]
function Board:calculateMatches()
    local matches = {}

    -- how many of the same color blocks in a row we've found
    local matchNum = 1

    -- horizontal matches first
    for y = 1, 8 do
        local colorToMatch = self.tiles[y][1].color

        matchNum = 1

        -- every horizontal tile
        for x = 2, 8 do

            -- if this is the same color as the one we're trying to match...
            if self.tiles[y][x].color == colorToMatch then
                matchNum = matchNum + 1
            else

                -- set this as the new color we want to watch for
                colorToMatch = self.tiles[y][x].color

                -- if we have a match of 3 or more up to now, add it to our matches table
                if matchNum >= 3 then
                  -- Indicates if there's a shiny Tile in the match.
                    local rowDel = false
                    local match = {}
                    -- Check for shiny Tiles in the match (row).
                    for x2 = x - 1, x - matchNum, -1 do
                        -- If there's a shiny Tile, delete row.
                        if self.tiles[y][x2].shiny then
                          rowDel = true
                          break
                        end
                    end

                    if rowDel then
                      -- Remove shiny tiles if present.
                      match = self:delRow(y)
                    else
                      for x2 = x - 1, x - matchNum, -1 do
                          -- add each tile to the match that's in that match
                          table.insert(match, self.tiles[y][x2])
                          end
                    end
                    -- add this match to our total matches table
                    table.insert(matches, match)
                end

                matchNum = 1

                -- don't need to check last two if they won't be in a match
                if x >= 7 then
                    break
                end
            end
        end

        -- account for the last row ending with a match
        if matchNum >= 3 then
            local match = {}
            -- Indicates if there's a shiny Tile in the match.
            local rowDel = false
            -- go backwards from end of last row by matchNum
            for x = 8, 8 - matchNum + 1, -1 do
                 -- Check for shiny Tiles in the match (row).
                if self.tiles[y][x].shiny then
                  rowDel = true
                  break
                end
            end
            -- Add the matching Tiles to the match table.
            if rowDel then
              -- Remove shiny tiles if present.
              match = self:delRow(y)
            else
              for x = 8, 8 - matchNum + 1, -1 do
                table.insert(match, self.tiles[y][x])
              end
            end
            table.insert(matches, match)
        end
      end

    -- vertical matches
    for x = 1, 8 do
        local colorToMatch = self.tiles[1][x].color

        matchNum = 1

        -- every vertical tile
        for y = 2, 8 do
            if self.tiles[y][x].color == colorToMatch then
                matchNum = matchNum + 1
            else
                colorToMatch = self.tiles[y][x].color

                if matchNum >= 3 then
                    local colDel = false
                    local match = {}
                    -- Check for shiny Tiles in the match (column).
                    for y2 = y - 1, y - matchNum, -1 do
                        if self.tiles[y2][x].shiny then
                          colDel = true
                          break
                        end
                    end
                      -- Add the matching Tiles to the match table.
                      if colDel then
                        match = self:delCol(x)
                      else
                      for y2 = y - 1, y - matchNum, -1 do
                        table.insert(match, self.tiles[y2][x])
                      end
                    end
                    table.insert(matches, match)
                end

                matchNum = 1

                -- don't need to check last two if they won't be in a match
                if y >= 7 then
                    break
                end
            end
        end

        -- account for the last column ending with a match
        if matchNum >= 3 then
            local match = {}
            local colDel = false
            -- Check for shiny Tiles in the match (column).
            for y = 8, 8 - matchNum + 1, -1 do
                if self.tiles[y][x].shiny then
                  colDel = true
                  break
                end
              end
              -- Add the matching Tiles to the match table.
              if colDel then
                match = self:delCol(x)
              else
                for y = 8, 8 - matchNum + 1, -1 do
                  table.insert(match, self.tiles[y][x])
                end
            end

            table.insert(matches, match)
        end
    end

    -- store matches for later reference
    self.matches = matches

    -- return matches table if > 0, else just return false
    return #self.matches > 0 and self.matches or false
end

--[[
    Remove the matches from the Board by just setting the Tile slots within
    them to nil, then setting self.matches to nil.
]]
function Board:removeMatches()
    for k, match in pairs(self.matches) do
        for k, tile in pairs(match) do
            self.tiles[tile.gridY][tile.gridX] = nil
        end
    end

    self.matches = nil
end

--[[
    Generates a table of random color indices without duplicates.
    This function creates a table containing unique random color indices. It ensures
    that each color index is unique by checking if it has already been added to the table.
    ]]
function Board:getRandColor(numColors)
  -- Create an empty table to store the random color indices.
  local colorTable = {}
  for i = 1, numColors do
    local x = 0
    while x == 0 do
      -- Generate a random number between 1 and 18 (inclusive).
      x = math.random(18)
      -- Check if the generated random number 'x' already exists in 'colorTable'.
        for k, color in pairs(colorTable) do
          if color == x then
            -- Reset 'x' to zero if it already exists in the table.
            x = 0
            break
          end
        end
      end
      table.insert(colorTable, x)
    end
    -- Return the table containing unique random color indices.
    return colorTable
end

--[[
    Shifts down all of the tiles that now have spaces below them, then returns a table that
    contains tweening information for these new tiles.
]]
function Board:getFallingTiles()
    -- tween table, with tiles as keys and their x and y as the to values
    local tweens = {}

    -- for each column, go up tile by tile till we hit a space
    for x = 1, 8 do
        local space = false
        local spaceY = 0

        local y = 8
        while y >= 1 do

            -- if our last tile was a space...
            local tile = self.tiles[y][x]

            if space then

                -- if the current tile is *not* a space, bring this down to the lowest space
                if tile then

                    -- put the tile in the correct spot in the board and fix its grid positions
                    self.tiles[spaceY][x] = tile
                    tile.gridY = spaceY

                    -- set its prior position to nil
                    self.tiles[y][x] = nil

                    -- tween the Y position to 32 x its grid position
                    tweens[tile] = {
                        y = (tile.gridY - 1) * 32
                    }

                    -- set Y to spaceY so we start back from here again
                    space = false
                    y = spaceY

                    -- set this back to 0 so we know we don't have an active space
                    spaceY = 0
                end
            elseif tile == nil then
                space = true

                -- if we haven't assigned a space yet, set this to it
                if spaceY == 0 then
                    spaceY = y
                end
            end

            y = y - 1
        end
    end

    -- create replacement tiles at the top of the screen
    for x = 1, 8 do
        for y = 8, 1, -1 do
            local tile = self.tiles[y][x]

            -- if the tile is nil, we need to add a new one
            if not tile then
                local var = (math.random(6) == 1) and math.min(self.maxVar, math.random(2,6)) or 1
                -- new tile with random color and variety
                local tile = Tile(x, y, self.dColors[math.random(self.numColors)], var)
                tile.y = -32
                self.tiles[y][x] = tile

                -- create a new tween to return for this tile to fall down
                tweens[tile] = {
                    y = (tile.gridY - 1) * 32
                }
            end
        end
    end

    return tweens
end
-- Update function to update the Tiles on the Board
function Board:update(dt)
    for y = 1, #self.tiles do
      for x = 1, #self.tiles[1] do
        self.tiles[y][x]:update(dt)
      end
    end
end

-- Render function to draw the Tiles on the Board.
function Board:render()
    for y = 1, #self.tiles do
        for x = 1, #self.tiles[1] do
            self.tiles[y][x]:render(self.x, self.y)
        end
    end
end
--[[
    Retrieves a row of Tiles for potential deletion.
    This helper function returns a table containing all Tiles 
    in a specified row 'y' on the board.
    ]]
function Board:delRow(y)
  local match = {}

    for x = 1, 8 do
      -- Add each tile in the row to the 'match' table
      table.insert(match, self.tiles[y][x])
    end
    -- Return the table containing matching tiles in the row
    return match
end

--[[
    Retrieves a column of Tiles for potential deletion.
    This helper function returns a table containing all Tiles
    in a specified column 'x' on the board.
]]
function Board:delCol(x)
  local match = {}

    for y = 1,8 do
      -- Add each tile in the column to the 'match' table
      table.insert(match, self.tiles[y][x])
    end
    -- Return the table containing matching tiles in the column
    return match
end
--[[
    Swaps the positions of two Tiles on the board.
    This function swaps the grid positions of two specified Tiles 
    't1' and 't2' on the board, updating their grid coordinates
    and updating the tile grid with their new positions.
    ]]
function Board:swapTile(t1, t2)
  local temp1 = t1.gridX
  local temp2 = t1.gridY

  t1.gridX =  t2.gridX
  t1.gridY = t2.gridY

  t2.gridX = temp1
  t2.gridY = temp2

  self.tiles[t1.gridY][t1.gridX] = t1
  self.tiles[t2.gridY][t2.gridX] = t2
end

--[[ 
    Function to check for potential matches across the game board.
    This function simulates swaps between adjacent tiles and checks if any of
    these swaps result in matches, indicating potential moves for the player.
    Returns true if there are potential matches, and false if not.
]]
function Board:potentialMatches() --potential Matches across the board
  for y = 1, 8 do

    for x = 1, 8 do
      -- Swaps the current Tile with the one to its left.   
      if x > 1 then
      self:swapTile(self.tiles[y][x], self.tiles[y][x-1])
        -- Check if this swap results in a match.
        if self:calculateMatches() then
          -- Swap back to the original position.
          self:swapTile(self.tiles[y][x], self.tiles[y][x-1])
          return true
        end
        -- Swap back to the original position to undo the change.
        self:swapTile(self.tiles[y][x], self.tiles[y][x-1])
      end
      -- Swaps the current Tile with the one above it.
      if y > 1 then 
      self:swapTile(self.tiles[y][x], self.tiles[y-1][x])
        if self:calculateMatches() then
          self:swapTile(self.tiles[y][x], self.tiles[y-1][x])
          return true
          end
        self:swapTile(self.tiles[y][x], self.tiles[y-1][x])
      end
      -- Swaps the current Tile with the one to its right.
      if x < 8 then
      self:swapTile(self.tiles[y][x], self.tiles[y][x+1])
        if self:calculateMatches() then
          self:swapTile(self.tiles[y][x], self.tiles[y][x+1])
          return true
          end
        self:swapTile(self.tiles[y][x], self.tiles[y][x+1])
      end
      -- Swaps the current Tile with the one below it.
      if y < 8 then 
      self:swapTile(self.tiles[y][x], self.tiles[y+1][x])
        if self:calculateMatches() then
          self:swapTile(self.tiles[y][x], self.tiles[y+1][x])
          return true
        end
        self:swapTile(self.tiles[y][x], self.tiles[y+1][x])
        end
    end
  end
  return false
end