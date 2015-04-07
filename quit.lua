require"modules/hook"

local CONFIRMED_QUIT = false


hook.Add("SingleKeyPressed", "Exit the game", function(key)
	if key == "escape" then 
		love.event.quit( )
	end
end)

local function AskForRating()
	HAD_RATED = true
	print"asked"
end

local function AskForConfirm()
 CONFIRMED_QUIT = true
end

function love.quit()
	if not HAD_RATED then
		AskForRating()
		do_save_data()
		return true 
	end

	if not CONFIRMED_QUIT then
		AskForConfirm()
		return true
	end

	return false
end
