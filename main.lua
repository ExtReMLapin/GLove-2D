require "input"
require "helppage"
require "maingui"
require "tutorial"

local loaded = {}
local i = 1
local http;
local time = os.time()

Msg = io.write;
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
end


_gamestate = "onch"

function love.draw()
	local x, y = love.mouse.getPosition()
	hook.Call("Draw")
	loveframes.draw()
	love.graphics.print("leftClick state : " .. tostring(leftClick), 200,700)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 700)
	love.graphics.print("menuFormer : " .. tostring(menuFormer), 600, 700)
	love.graphics.print("gamestate : " .. _gamestate, 400, 700)
	playerInfos()
	
end


hook.Add("MousePress", "MenuPress", function(x,y)
	print(41)

	if gamestate(x, y) == "playing" then
		if menuFormer then
			menuFormer:Remove()
		end
		principalMenu(x,y)
	elseif gamestate(x, y) == "se former" then
		seformerMenu(x,y)
	end
print(42)
end)