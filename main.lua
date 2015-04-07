require "data"
require "error"
require "ressources/fonts"
require "timersloop"
require "save"
require "events"
require "investir"
require "money"
require "clientsystem"
require "input"
require "maingui"
require "quit"
ffi = require 'ffi'


ffi.cdef[[
int MessageBoxA(void *w, const char *txt, const char *cap, int type);
]]


local http;
local time = os.time()

function include(file)
	return require(string.gsub(file, ".lua", ""))
end

function load_modules()
	local files =  love.filesystem.getDirectoryItems("modules")
	for k,v in ipairs(files) do
		include("modules/" .. v)
	end
	http = require("socket.http")
	require("save")
end


function love.load()
	UiBlock = love.graphics.newImage("ressources/UiBlockPlayresize.png")
	tutoBubble = love.graphics.newImage("ressources/UiBulleTextesfixed.png")
	UiTab = love.graphics.newImage("ressources/UiBtnMenu.png")
	love.graphics.setBackgroundColor( 255,245,217 )
	love.filesystem.setIdentity( "GLove-2D" )
	loveframes = require("gui")
	load_modules()
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(0.2)
	init_restore()
	require "background"

	local theme = love.audio.newSource("ressources/theme.mp3", "static")


	theme:setVolume(0.1) -- 90% of ordinary volume
	theme:setPitch(1) -- one octave lower
	theme:setLooping(true)
	--theme:play()
	PrintTable(ffi)
	CreatePopUp("News test","Ceci est un test avec le nouveau \ndesign, il manque les boutons",{"lol","lol","lol","lol","lol" }, {function() love.mouse.setCursor(c_default) end,function() love.mouse.setCursor(c_default) end,function() love.mouse.setCursor(c_default) end })
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
	timer.check()
	leftClick = love.mouse.isDown("l")
end

function love.draw()
	hook.Call("BackBackGround") -- the real one .... this time eheh
	hook.Call("BackGroundDraw") -- wallpaper ?
	hook.Call("Draw")
	loveframes.draw()
	hook.Call("DrawOverFrame")
	hook.Call("OverLayDraw") -- Menu echap, par exemple
end

function love.resize(w, h)
	ScrW = w
	ScrH = h
end



hook.Add("MousePress", "MenuPress", function(x,y)
	-- principalMenu(x,y)
	ffi.C.MessageBoxA(nil, "lol ta cliké sur ta souri!", "mdr", 0)

end)

hook.Add("SaveRestored", "HUDPAINTRESTORED", function()
	hook.Add("BackGroundDraw", "Infos background", function()
		DrawDateBox()
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), ScrW*10/1280 ,ScrH-50)
		--love.graphics.print("X,Y,Z debug:"..tostring(x)..", "..tostring(y)..", "..tostring(z), 200,700)
		--love.graphics.print("D,M,Y debug:"..tostring(T_DAY)..", "..tostring(T_MONTH)..", "..tostring(T_YEAR), 600,700)
		--love.graphics.print("Duree min: "..tostring(dureeInvestisseurMin) or "nul", 300, 700)
		--love.graphics.print("Popularité:"..tostring(Popularity) or "nul", 600,700)
		
		--love.graphics.print('Memory actually used (in kB): ' .. math.Round(collectgarbage('count')), ScrW*900/1280,ScrH-50)
		--love.graphics.print("Engouement : " .. engouement, ScrW*200/1280,ScrH-50)
		--love.graphics.print("Réputation : " .. reputation, ScrW*400/1280, ScrH-50)

	end)
end)
