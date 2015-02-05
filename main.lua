require "menu"
require "input"
require "issomething"
require "investpage"

local loaded = {}
local i = 1
local http;

Msg = io.write;
gamestate = "logging"
username = ""

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
			button:Remove()
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
	love.graphics.setBackgroundColor(55,55,55)
	title = love.graphics.newFont("ressources/Existence-Light.ttf", 27)
	subtitle = love.graphics.newFont("ressources/Existence-Light.ttf",23)
	menuButton(150, 680, "Investir", "invest")
	menuButton(550, 680, "Mon Compte", "account")
	menuButton(1000, 680, "Aide", "help")
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
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
		investMenu()
	end
	if gamestate == "playing.account" then
		love.graphics.print("my account")
	end
	mainGUI()
end


