local Player = {}

local zi = 2
State_Manager.addState("game", "player", zi)
State_Manager.exclude("game", "player", {update = false})

local rec = {
	x = 100,
	y = 125,
	w = 100,
	h = 100,
	dir = 1,
	speed = 200
}

function Player:load()
	print("Player loaded")
end

function Player:update(dt)
	rec.x = rec.x + (rec.speed * rec.dir) * dt

	if rec.x < 0 then
		rec.dir = 1
	elseif rec.x > love.graphics.getWidth() - rec.w then
		rec.dir = -1
	end
end

function Player:draw()
	love.graphics.setColor(1,1,1)
	love.graphics.rectangle("fill", rec.x, rec.y, rec.w, rec.h)
	love.graphics.setColor(0,0,0)
	love.graphics.print(zi, rec.x, rec.y)
	love.graphics.setColor(1,1,1)
end

return Player