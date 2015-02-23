require "menu"
require "input"
require "helppage"
require "maingui"
require "tutorial"

local loaded = {}
local i = 1
local http;

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

end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
	timer.check()
end

function love.draw()
	loveframes.draw()
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	love.graphics.setFont(subtitle)
	love.graphics.setColor(235,62,9)
	love.graphics.print(username .. " - Niveau : " .. usrlevel, 10, 10)
	love.graphics.setColor(0,0,0)
	love.graphics.print("Infos joueur :", 1000, 20)
	love.graphics.setFont(graphfont)
	love.graphics.print("Argent en compte : $" .. virtual_account_money, 1000, 70)
	love.graphics.print("Croissance : ", 1000, 100)
	if account_growth >= 0 then
		love.graphics.setColor(102,204,0)
	else
		love.graphics.setColor(204,0,0)
	end
	love.graphics.print(account_growth .. "%", 998 + graphfont:getWidth("Croissance : "), 100)
	if gamestate == "tutorial" then
		tutorialText()
	end
end