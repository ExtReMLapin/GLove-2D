local ONEPRESSED = false
require("modules/hook")

function love.mousepressed(x, y, button)
	if not ONEPRESSED then
		hook.Call("MousePress", nil, x, y, button)
		ONEPRESSED = true
	end

	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	ONEPRESSED = false
	loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)

	hook.Call("KeyPressed", nil, key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)

	hook.Call("KeyReleased", nil, key )
	loveframes.keyreleased(key)
end

function love.textinput(text) 
	loveframes.textinput(text)
end