local Player = {}

State_Manager.addState("game.player", 10)

function Player:load()
	print("Player loaded")
end

function Player:update()
end

function Player:draw()
	love.graphics.setColor(1,1,0)
	love.graphics.rectangle("fill", 100, 175, 100, 100)
	love.graphics.setColor(1,1,1)
end

return Player