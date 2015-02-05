require "menu"
require "input"
require "investpage"

local loaded = {}
local i = 1
local http;

Msg = io.write;
gamestate = "logging"
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
end


function gamestate_loggin(key)
	if gamestate == "logging" then
		username = username .. key
		if key == "kpenter" then
			gamestate = "playing"
			textinput:Remove()
			usrbox:Remove()
		end
	end
	if key == "escape" then
		gamestate = "menu"
	end
end


function love.load()
	loveframes = require("gui")
	load_modules()
	love.graphics.setBackgroundColor(60,60,60)
	title = love.graphics.newFont("ressources/Existence-Light.ttf", 27)
	subtitle = love.graphics.newFont("ressources/Existence-Light.ttf",23)
	graphfont = love.graphics.newFont(12)
	menuButton(150, 680, "Investir", "invest")
	menuButton(550, 680, "Mon Compte", "account")
	menuButton(1000, 680, "Aide", "help")
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(2)
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
end

function love.draw()
	loveframes.draw()
	if gamestate == "logging" then
		loggingDraw(username)
	end

	if gamestate == "menu" then
		menuDraw()
	end
	if gamestate == "playing.invest" then
		investMenu(Globalcorpname)
	end
	if gamestate ~= "playing.invest" then
		if search then
			search:Remove()
		end
	end
	if gamestate == "playing.account" then
		love.graphics.print("my account")
	end
	mainGUI()
end


