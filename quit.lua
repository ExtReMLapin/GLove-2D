require"modules/hook"


hook.Add("SingleKeyPressed", "Exit the game", function(key)
	if key == "escape" then 
		love.event.quit( )
	end
end)


local RATED = false

function AskForRating()
	RATED = true
	print"asked"
end

function love.quit()
	if not RATED then
		AskForRating()
		return true 
	end

	return false
end
