require "menu"
require "input"
require "investpage"
require "accountpage"
require "helppage"

local loaded = {}
local i = 1
local http;

Msg = io.write;
gamestate = "playing.account"
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
		if key == "kpenter" or key == "return" then
			gamestate = "playing.account"
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
	love.graphics.setBackgroundColor(232,235,239)
	title = love.graphics.newFont("ressources/Ubuntu-B.ttf", 27)
	subtitle = love.graphics.newFont("ressources/Ubuntu-B.ttf",23)
	other_text = love.graphics.newFont("ressources/FuturaExtended.ttf", 18)
	graphfont = love.graphics.newFont(12)
	menuButton(150, 680, "Investir", "invest")
	menuButton(550, 680, "Mon Compte", "account")
	menuButton(1000, 680, "Aide", "help")
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(2)
	accountBought()
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
end

function love.draw()
	loveframes.draw()
	--[[if gamestate == "logging" then
		accountInfos()
		loggingDraw(username)
	end]]

	if gamestate == "menu" then
		menuDraw()
	end
	if gamestate == "playing.invest" then
		investMenu(Globalcorpname)
	end
	if gamestate ~= "playing.invest" then
		if search then 
			loveframes.util.RemoveAll()
		end
	end
	if gamestate == "playing.account" then
		accountInfos()
	end
	if gamestate == "playing.help" then
	end
	mainGUI()
end