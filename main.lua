require "input"
require "maingui"
require "tutorial"
require "ressources/fonts"
require "timersloop"
require "save"
require "events"
require "data"
require "investir"

local http;
local time = os.time()

Msg = io.write;
Globalcorpname = "Apple"
_gamestate = "nul"
clickedButton = "nul"

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
	CreatePopUp("yeye, that's not what ur mom said", "What the fuck did you just fucking say about me, you little bitch? I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. I am trained in gorilla warfare and I’m the top sniper in the entire US armed forces. You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker. As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You’re fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that’s just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit. If only you could have known what unholy retribution your little “clever” comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn’t, you didn’t, and now you’re paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it. You’re fucking dead, kiddo.")

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
		love.graphics.print("leftClick state : " .. tostring(leftClick), 200,700)
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 700)
	end)
end)