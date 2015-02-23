local FIRSTPRESSED = false
require("modules/hook")

function love.mousepressed(x, y, button)
	if not FIRSTPRESSED then
		hook.Call("UniquePress", nil, x, y, button)
	end
	FIRSTPRESSED = true
	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	FIRSTPRESSED = false
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


hook.Add("UniquePress", "menupoop", function(x, y, button)

	if gamestate == "playing" then
		menuOnClick(x,y, button)
	elseif gamestate == "formation" then
		seFormer(x,y,button)
	end

end)

