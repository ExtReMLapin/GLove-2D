local FIRSTPRESSED = false


function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
	if gamestate == "playing" then
		menuOnClick(x,y, button)
	elseif gamestate == "formation" then
		seFormer(x,y,button)
	end
end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)

end

function love.keypressed(key, unicode)
	if not FIRSTPRESSED then
		hook.Call("UniquePress", nil, key, unicode)
	end
	FIRSTPRESSED = true
	hook.Call("KeyPressed", nil, key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	FIRSTPRESSED = false
	hook.Call("KeyReleased", nil, key )
	loveframes.keyreleased(key)
end

function love.textinput(text) 
	loveframes.textinput(text)
end