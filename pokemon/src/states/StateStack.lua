--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

StateStack = Class{}

function StateStack:init()
    self.states = {}
end

function StateStack:update(dt)
    self.states[#self.states]:update(dt)
end

function StateStack:processAI(params, dt)
    self.states[#self.states]:processAI(params, dt)
end

function StateStack:render()
    for i, state in ipairs(self.states) do
        state:render()
    end
end

function StateStack:clear()
    self.states = {}
end

-- Pushes a new state onto the state stack.
-- The state is added to the end of the stack.
-- If the state's name is 'TakeTurnState' or 'BaseState', the 'enter' function of the state is called.
-- 
-- Parameters:
-- - state: The state to push onto the stack.
function StateStack:push(state)
    table.insert(self.states, state)

    if state.name == 'TakeTurnState' or state.name == 'BaseState' then 
        state:enter()
    end 
end

-- Pops the last state from the state stack.
-- If there are states on the stack, it removes the last state.
-- If the removed state's name is 'BaseState' or 'BattleState', the 'exit' function of the state is called.
function StateStack:pop()
 
    if #self.states > 0 then
        local state = self.states[#self.states]
        if state.name == 'BaseState' or state.name == 'BattleState' then
            state:exit()
        end
        table.remove(self.states)
    end
end