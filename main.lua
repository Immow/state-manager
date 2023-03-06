TPRINT = require("tprint")
State_Manager = require("state-manager")

function love.load()
	State_Manager.requireState("states.world")
	State_Manager.requireState("states.menu")
	State_Manager.requireState("states.overlay")
	State_Manager.requireState("states.player")
	State_Manager.setState("game")
	State_Manager:load()
end

function love.mousepressed(mx, my, mouseButton)
	State_Manager:mousepressed(mx, my, mouseButton)
end

function love.mousereleased(mx, my, mouseButton)
	State_Manager:mousereleased(mx, my, mouseButton)
end

function love.mousemoved(x, y, dx, dy, istouch)
	State_Manager:mousemoved(x, y, dx, dy, istouch)
end

function love.keypressed(key,scancode,isrepeat)
	State_Manager:keypressed(key,scancode,isrepeat)
	if scancode == "space" then
		love.event.quit("restart")
	end
end

function love.draw()
	State_Manager:draw()
end

function love.update(dt)
	State_Manager:update(dt)
end