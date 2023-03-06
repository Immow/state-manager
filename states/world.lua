local World = {}

State_Manager.addState("game.world")

function World:load()
	print("World loaded")
end

function World:update()
end

function World:draw()
	love.graphics.setColor(1,0,0)
	love.graphics.rectangle("fill", 100, 100, 100, 100)
	love.graphics.setColor(1,1,1)
end

return World