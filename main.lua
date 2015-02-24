require "menu"
require "input"
require "helppage"
require "maingui"
require "tutorial"

local loaded = {}
local i = 1
local http;
local time = os.time()

Msg = io.write;
gamestate = "tutorial"
Globalcorpname = "Apple"

function include(file)
	return require(string.gsub(file, ".lua", ""))
end

function load_modules()
	local files =  love.filesystem.getDirectoryItems("modules")
	for i,v in ipairs(files) do
		include("modules/" .. v)
		loaded[i] = v
		i = i + 1;
	end
	http = require("socket.http")
	require("save")
end


function gamestate_loggin(key)

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
	love.filesystem.setIdentity( "GLove-2D" )
	loveframes = require("gui")
	load_modules()

	background = loveframes.Create("image")
	background:SetImage("ressources/background.png")
	title = love.graphics.newFont("ressources/Ubuntu-B.ttf", 27)
	subtitle = love.graphics.newFont("ressources/Ubuntu-B.ttf",23)
	other_text = love.graphics.newFont("ressources/FuturaExtended.ttf", 18)
	graphfont = love.graphics.newFont(12)
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(2)
	init_restore()
	--precachedata()
	tutorialText()
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
	timer.check()
	leftClick = love.mouse.isDown("l")
	realX = love.mouse.getX()
	realY = love.mouse.getY()
end

function love.draw()
	hook.Call("Draw")
	loveframes.draw()
	love.graphics.print("leftClick state : " .. tostring(leftClick), 200,700)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 700)
	love.graphics.print("menuFormer : " .. tostring(menuFormer), 600, 700)
	love.graphics.print("gamestate : " .. gamestate, 400, 700)
	playerInfos()
	
end


hook.Add("MousePress", "MenuPress", function()
	print(41)

	if gamestate == "playing" then
		if menuFormer then
			menuFormer:Remove()
		end
		principalMenu(realX,realY)
	elseif gamestate == "se former" then
		seformerMenu()
	end
print(42)
end)