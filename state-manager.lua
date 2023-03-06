local State_Manager = {}

local states = {}
local requiredStates = {}
local currentState = nil

function State_Manager.addState(state_module, order)
	if not state_module then error("state needs a state and module") end
	if state_module:match("[$.]") then
		local state = state_module:match("([^.]+)")
		local module  = state_module:match("[^.]+$")

		if not states[state] then
			states[state] = {
				drawOrder = {},
				module = {},
			}
		end

		order = order or 1
		states[state].module[module] = {exclude = {}, drawPosition = order, name = module}

		if #states[state].drawOrder == 0 then
			table.insert(states[state].drawOrder, module)
		else
			for i = #states[state].drawOrder, 1, -1 do
				local v = states[state].drawOrder[i]
				if order == states[state].module[v].drawPosition then
					table.insert(states[state].drawOrder, i, module)
					break
				elseif order > states[state].module[v].drawPosition then
					table.insert(states[state].drawOrder, i+1, module)
					break
				elseif i == 1 then
					table.insert(states[state].drawOrder, i, module)
				end
			end
		end
	else
		error("addState needs a state and module, ea: myState.module")
	end
end

function State_Manager.requireState(state)
	requiredStates[state:match("[^.]+$")] = require(state)
end

function State_Manager.setState(state)
	currentState = state
end

function State_Manager.exclude(str, fn)
	local state  = str:match("([^.]+)")
	local module = str:match("[^.]+$")
	states[state].module[module].exclude = fn
end

function State_Manager:load()
	print(tprint(states))
end

function State_Manager:update(dt)
	-- if requiredStates[currentState].update then
	-- 	requiredStates[currentState]:update(dt)
	-- end

	-- for child, i in pairs(states[currentState]) do
	-- 	if requiredStates[child].update then
	-- 		if i.update or i.update == nil then
	-- 			requiredStates[child]:update(dt)
	-- 		end
	-- 	end
	-- end

	-- for i, state in ipairs(states[currentState].drawOrder) do
	-- 	if not states[currentState].module[state].exclude.update then
	-- 		requiredStates[state]:update(dt)
	-- 	end
	-- end
end

function State_Manager:draw()
	-- if requiredStates[currentState].draw then
	-- 	requiredStates[currentState]:draw()
	-- end

	-- for child, _ in pairs(states[currentState]) do
	-- 	if requiredStates[child].draw then
	-- 		requiredStates[child]:draw()
	-- 	end
	-- end

	for i, state in ipairs(states[currentState].drawOrder) do
		if not states[currentState].module.exclude then
			requiredStates[state]:draw()
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