local State_Manager = {}

local states = {}
local requiredStates = {}
local currentState = nil

---@param state string state the module belongs to.
---@param module string the file that your required in main.lua.
---@param order integer draw order z-index, draws from low to high.
function State_Manager.addState(state, module, order)
	if not state and not module then error("state needs a state and module") end

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
end

---@param state string: require path, ea: "myfolder.filename"
function State_Manager.requireState(state)
	requiredStates[state:match("[^.]+$")] = require(state)
end

---@param state string: sets active state
function State_Manager.setState(state)
	currentState = state
end

---@param state string: state the module belongs to
---@param module string: the file that your required in main.lua.
---@param fn {update: true|false, draw: true|false, mouspressed: true|false, mousereleased: true|false, mousemoved: true|false, keypressed: true|false}, functions you want to exclude from running
function State_Manager.exclude(state, module, fn)
	states[state].module[module].exclude = fn
end

function State_Manager:load()
	print(tprint(states))
end

function State_Manager:update(dt)
	for _, state in ipairs(states[currentState].drawOrder) do
		if requiredStates[state].update then
			if not states[currentState].module[state].exclude.update then
				requiredStates[state]:update(dt)
			end
		end
	end
end

function State_Manager:draw()
	for _, state in ipairs(states[currentState].drawOrder) do
		if requiredStates[state].draw then
			if not states[currentState].module[state].exclude.draw then
				requiredStates[state]:draw()
			end
		end
	end
end

function State_Manager:mousepressed(mx, my, mouseButton)
	for _, state in ipairs(states[currentState].drawOrder) do
		if requiredStates[state].mousepressed then
			if not states[currentState].module[state].exclude.mousepressed then
				requiredStates[state]:mousepressed(mx, my, mouseButton)
			end
		end
	end
end

function State_Manager:mousereleased(mx, my, mouseButton)
	for _, state in ipairs(states[currentState].drawOrder) do
		if requiredStates[state].mousereleased then
			if not states[currentState].module[state].exclude.mousereleased then
				requiredStates[state]:mousereleased(mx, my, mouseButton)
			end
		end
	end
end

function State_Manager:mousemoved(x, y, dx, dy, istouch)
	for _, state in ipairs(states[currentState].drawOrder) do
		if requiredStates[state].mousemoved then
			if not states[currentState].module[state].exclude.mousemoved then
				requiredStates[state]:mousemoved(x, y, dx, dy, istouch)
			end
		end
	end
end

function State_Manager:keypressed(key,scancode,isrepeat)
	for _, state in ipairs(states[currentState].drawOrder) do
		if requiredStates[state].keypressed then
			if not states[currentState].module[state].exclude.keypressed then
				requiredStates[state]:keypressed(key,scancode,isrepeat)
			end
		end
	end
end

return State_Manager