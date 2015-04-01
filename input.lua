local ONEPRESSED = false
MOUSE_STATE = false
MOUSE_S_X = nil
local KEY_PRESSED = nil
MOUSE_S_Y = nil



require("modules/hook");

function love.mousepressed(x, y, button)
	if not MOUSE_STATE then
		MOUSE_S_X, MOUSE_S_Y = love.mouse.getPosition( )
		hook.Call("LongMousePress")
	end
	MOUSE_STATE = true
	if not ONEPRESSED then
		hook.Call("MousePress", x, y, button)
		ONEPRESSED = true
	end

	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	MOUSE_STATE = false
	MOUSE_S_X = nil
	MOUSE_S_Y = nil
	ONEPRESSED = false

	loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	if key ~= KEY_PRESSED then
		KEY_PRESSED = key
		hook.Call("SingleKeyPressed", key)
	end

	hook.Call("KeyPressed", key, unicode)
	loveframes.keypressed(key, unicode)
end


function love.keyreleased(key)
	hook.Call("KeyReleased", key )
	loveframes.keyreleased(key)
end

function love.textinput(text) 
	loveframes.textinput(text)
end
