local World = {}

State_Manager.addState("game", "world", 5)
State_Manager.addState("cow", "world")
State_Manager.exclude("game", "world", {update = true})

local rec = {
	x = 100,
	y = 300,
	w = 100,
	h = 100,
	dir = 1,
	speed = 200
}

function World:load()
	print("World loaded")
end

function World:init()
	print("ran init in World")
end

function World:update(dt)
	rec.x = rec.x + (rec.speed * rec.dir) * dt

	if rec.x < 0 then
		rec.dir = 1
	elseif rec.x > love.graphics.getWidth() - rec.w then
		rec.dir = -1
	end
end

function World:keypressed(key, scancode, isrepeat)
	if key == "s" then
		if State_Manager.getState() ~= "cow" then
			State_Manager.setState("cow")
		else
			State_Manager.setState("game")
		end
	elseif key == "t" then
		print("I pressed t")
	end
end

function World:draw()
	love.graphics.setColor(0,1,0)
	love.graphics.rectangle("fill", rec.x, rec.y, rec.w, rec.h)
	love.graphics.setColor(1,1,1)
end

return World