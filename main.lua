require "menu"
require "input"
require "helppage"
require "maingui"

local loaded = {}
local i = 1
local http;

Msg = io.write;
gamestate = "playing"
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
	loveframes = require("gui")
	load_modules()
	love.graphics.setBackgroundColor(252,237,157)
	love.filesystem.setIdentity( "GLove-2D" )
	title = love.graphics.newFont("ressources/Ubuntu-B.ttf", 27)
	subtitle = love.graphics.newFont("ressources/Ubuntu-B.ttf",23)
	other_text = love.graphics.newFont("ressources/FuturaExtended.ttf", 18)
	graphfont = love.graphics.newFont(12)
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(2)
	init_restore()
	room = loveframes.Create("image")
	room:SetImage("ressources/roomiso.jpg")
	room:Center()
	--precachedata()

end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
	timer.check()
end

function love.draw()
	loveframes.draw()

	mainGui()
end