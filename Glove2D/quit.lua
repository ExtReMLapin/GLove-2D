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
	pausemenucover = loveframes.Create("image",g_pausemenu)
	pausemenucover:SetImage("ressources/UiBlockEchap.png"):SetScale(0.43,0.71):SetPos(-8,-3)
	menutext = loveframes.Create("text",g_pausemenu)
	menutext:SetText("Menu"):SetX(168):SetY(15):SetFont(popuptext)

	button1 = loveframes.Create("imagebutton", g_pausemenu)
		button1:SetPos(g_pausemenu:GetWidth()/2 - 150,100)
		button1:SetImage("ressources/UiBtnFixed.png"):SetText("")
		button1:SizeToImage():SetText("Reprendre")
		button1.OnClick = function(object)
			PauseMenu()
		end
	button2 = loveframes.Create("imagebutton", g_pausemenu)
		button2:SetPos(g_pausemenu:GetWidth()/2-150,170)
		button2:SetImage("ressources/UiBtnFixed.png"):SetText("")
		button2:SizeToImage():SetText("Options")
		

	button3 = loveframes.Create("imagebutton", g_pausemenu)
		button3:SetPos(g_pausemenu:GetWidth()/2-150,240)
		button3:SetImage("ressources/UiBtnFixed.png")
		button3:SizeToImage():SetText("Quitter")
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
