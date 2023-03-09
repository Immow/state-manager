local Overlay = {}

local zi = 3
State_Manager.addState("game", "overlay", zi)

local rec = {
	x = 100,
	y = 150,
	w = 100,
	h = 100,
	dir = 1,
	speed = 200
}

function Overlay:load()
	print("Overlay loaded")
end

function Overlay:update()
end

function Overlay:draw()
	love.graphics.setColor(0,0,1)
	love.graphics.rectangle("fill", rec.x, rec.y, rec.w, rec.h)
	love.graphics.setColor(0,0,0)
	love.graphics.print(zi, rec.x, rec.y)
	love.graphics.setColor(1,1,1)
end

return Overlay