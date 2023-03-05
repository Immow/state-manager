local Game = {}

State_Manager.addState("game")

function Game:load()
	print("Game loaded")
end

function Game:update()
end

function Game:draw()
	love.graphics.setColor(1,0,0)
	love.graphics.rectangle("line", 100, 100, 100, 100)
	love.graphics.setColor(1,1,1)
end

return Game