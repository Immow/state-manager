local Menu = {}

State_Manager.addState("game.menu")

function Menu:load()
	print("Menu loaded")
end

function Menu:update()
end

function Menu:draw()
	love.graphics.setColor(0,1,0)
	love.graphics.rectangle("line", 100, 300, 100, 100)
	love.graphics.setColor(1,1,1)
end

return Menu