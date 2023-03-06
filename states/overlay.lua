local Overlay = {}

State_Manager.addState("game", "overlay", 2)

function Overlay:load()
	print("Overlay loaded")
end

function Overlay:update()
end

function Overlay:draw()
	love.graphics.setColor(0,0,1)
	love.graphics.rectangle("fill", 100, 125, 100, 100)
	love.graphics.setColor(1,1,1)
end

return Overlay