require"modules/hook"
PAUSED = false
local g_pausemenu;
local button1;
local button2;
local button3;
local button4;

local OPENED = false


local function update_frame_type(dt, frame)

	local base = frame	
	loveframes.collisioncount = 0
	loveframes.objectcount = 0
	loveframes.hover = false
	loveframes.hoverobject = false
	
	local downobject = loveframes.downobject
	if #loveframes.collisions > 0 then
		local top = loveframes.collisions[#loveframes.collisions]
		if not downobject then
			loveframes.hoverobject = top
		else
			if downobject == top then
				loveframes.hoverobject = top
			end
		end
	end
		
	loveframes.collisions = {}
	base:update(dt)
end


function PauseMenu()
	if OPENED then 
		hook.Remove("ThinkUnpaused", "PauseMenu Update")
		g_pausemenu:Remove()  OPENED = false PAUSED = false 
		return 
	end

	PAUSED = true
	OPENED = true
	g_pausemenu = loveframes.Create("panel")
	g_pausemenu:SetSize(400,600)
	g_pausemenu:SetPos(ScrW/2-g_pausemenu:GetWidth()/2, ScrH/2-g_pausemenu:GetHeight()/2)
	button1 = loveframes.Create("button", g_pausemenu)
		button1:SetPos(g_pausemenu:GetWidth()/2-100,100)
		button1:SetWidth(200)
		button1:SetHeight(50)

		button1:SetText("Reprendre")
		button1.OnClick = function(object, x, y)
		    PauseMenu()
		end
	button2 = loveframes.Create("button", g_pausemenu)
		button2:SetPos(g_pausemenu:GetWidth()/2-100,150)
		button2:SetWidth(200)
		button2:SetHeight(50)
		button2:SetText("Options")
		button2.OnClick = function(object, x, y)
		    --os.exit() -- à fix plus tard (such danger here)
		end

	button3 = loveframes.Create("button", g_pausemenu)
		button3:SetPos(g_pausemenu:GetWidth()/2-100,200)
		button3:SetWidth(200)
		button3:SetHeight(50)
		button3:SetText("Quitter")
		button3.OnClick = function(object, x, y)
		    os.exit() -- à fix plus tard (such danger here)
		end



	hook.Add("ThinkUnpaused", "PauseMenu Update", function(dt) 
		update_frame_type(dt, g_pausemenu)
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
