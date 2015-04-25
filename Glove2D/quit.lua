require"modules/hook"
PAUSED = false
local g_pausemenu;
local button1;
local button2;
local button3;
local button4;

local OPENED = false

function PauseMenu()
	if OPENED then 
		hook.Remove("ThinkUnpaused", "PauseMenu Update")
		g_pausemenu:Remove()  OPENED = false PAUSED = false 
		return 
	end

	PAUSED = true
	OPENED = true
	g_pausemenu = loveframes.Create("panel")
	g_pausemenu:SetSize(900,450)
	g_pausemenu:SetPos(ScrW/2-g_pausemenu:GetWidth()/2, 100)
	button1 = loveframes.Create("button", g_pausemenu)
		button1:SetPos(500,500)
		button1:SetWidth(200)
		button1:SetText("Button")
		button1:Center()
		button1.OnClick = function(object, x, y)
		    object:SetText("You clicked the button!")
		end
		button1.OnMouseEnter = function(object)
		    object:SetText("The mouse entered the button.")
		end
		button1.OnMouseExit = function(object)
		    object:SetText("The mouse exited the button.")
		end



	hook.Add("ThinkUnpaused", "PauseMenu Update", function() 
		g_pausemenu:update()
		button1:update()
	end)
end



hook.Add("SingleKeyPressed", "Exit the game", function(key)
	if key == "escape" then 
		love.event.quit( )
	end
end)





function love.quit()
	PauseMenu()
	return true

	--love.filesystem.write("exit.txt", "true")
end
