require "input"
require "maingui"
require "tutorial"
require "ressources/fonts"
require "timersloop"
require "save"
require "events"
require "data"
require "investir"
require "money"
require "sounds"
require "clientsystem"

local http;
local time = os.time()

Msg = io.write;

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

function precachedata()
	local pe = coroutine.create(function()
	for k, v in pairs(Brand) do
			coroutine.wait(3)
			bank.corpo_get_value_date(v.rn)
	end
	end)
	coroutine.resume(pe)
end

function love.load()
	love.graphics.setBackgroundColor( 255,245,217 )
	love.filesystem.setIdentity( "GLove-2D" )
	loveframes = require("gui")
	load_modules()
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(2)
	init_restore()
code = [[
	    print("Hello World")
	    CreatePopUp("yeye, that's not what ur mom said", "lel\nyeyeyeyeyeyeyeyyeyey\nrhzieurhzif\nrhzieurhzif\nrhzieurhzif")   
	]]	 
	createEvent( string.format("%i%i%i",2, 5, 1852), code)
		

	local music = love.audio.newSource("ressources/theme.mp3", "static")
	music:setLooping( true )
	music:play()
		
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
	timer.check()
	leftClick = love.mouse.isDown("l")
end

function love.draw()
	hook.Call("BackGroundDraw") -- wallpaper ?
	hook.Call("Draw")
	loveframes.draw()
	--playerInfos()
	hook.Call("OverLayDraw") -- Menu echap, par exemple

end


hook.Add("MousePress", "MenuPress", function(x,y)
	 principalMenu(x,y)
	 print("MousePress Call")


end)

hook.Add("SaveRestored", "HUDPAINTRESTORED", function()
	hook.Add("BackGroundDraw", "Infos background", function()
		DrawDateBox()
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 700)
		love.graphics.print("Duree min: "..tostring(dureeInvestisseurMin) or "nul", 300, 700)
		love.graphics.print("Prix pub:"..tostring(prixPublicite) or "nul", 600,700)
	end)
end)