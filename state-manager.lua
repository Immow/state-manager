local State_Manager = {}

local states = {}
local requiredStates = {}
local activeState = nil

function State_Manager.addState(state)
	if state:match("[$.]") then
		local firstWord = state:match("([^.]+)")
		local lastWord = state:match("[^.]+$")
		-- states[firstWord][lastWord] = {}
		table.insert(states[firstWord], lastWord)
	else
		states[state] = {}
	end
end

function State_Manager.requireState(state)
	requiredStates[state:match("[^.]+$")] = require(state)
end

function State_Manager.setState(state)
	activeState = state
end

function State_Manager:load()
	print(tprint(states))
end

function State_Manager:update(dt)

end

function State_Manager:draw()
	if requiredStates[activeState].draw then
		requiredStates[activeState]:draw()
	end

	for _, child in pairs(states[activeState]) do
		if requiredStates[child].draw then
			requiredStates[child]:draw()
		end
	end
end

function State_Manager:mousepressed(mx, my, mouseButton)

end

function State_Manager:mousereleased(mx, my, mouseButton)

end

function State_Manager:mousemoved(x, y, dx, dy, istouch)

end

function State_Manager:keypressed(key,scancode,isrepeat)

end

return State_Manager