local Menu = {}

local zi = 4
State_Manager.addState("game", "menu", zi)
-- State_Manager.exclude("game", "menu", {update = false})

local rec = {
	x = 100,
	y = 175,
	w = 100,
	h = 100,
	dir = 1,
	speed = 200
}

function Menu:load()
	print("Menu loaded")
end

function Menu:keypressed(key, scancode, isrepeat)
end

function Menu:update(dt)
	rec.x = rec.x + (rec.speed * rec.dir) * dt

	if rec.x < 0 then
		rec.dir = 1
	elseif rec.x > love.graphics.getWidth() - rec.w then
		rec.dir = -1
	end
end

function Menu:draw()
	love.graphics.setColor(0,1,0)
	love.graphics.rectangle("fill", rec.x, rec.y, rec.w, rec.h)
	love.graphics.setColor(0,0,0)
	love.graphics.print(zi, rec.x, rec.y)
	love.graphics.setColor(1,1,1)
end

return Menu