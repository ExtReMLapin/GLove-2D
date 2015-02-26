MOUSE_STATE = false
MOUSE_S_X = nil
MOUSE_S_Y = nil
require("modules/hook");

function love.mousepressed(x, y, button)

	if not MOUSE_STATE then
		MOUSE_S_X, MOUSE_S_Y = love.mouse.getPosition( )
	end

	MOUSE_STATE = true
	loveframes.mousepressed(x, y, button)
	menuClick(x,y)

end

function love.mousereleased(x, y, button)
	MOUSE_STATE = false
	MOUSE_S_X = nil
	MOUSE_S_Y = nil
	loveframes.mousereleased(x, y, button)

end

function love.keypressed(key, unicode)
	hook.Call("KeyPressed", nil, key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	loveframes.keyreleased(key)
end

function love.textinput(text) 
	loveframes.textinput(text)
end