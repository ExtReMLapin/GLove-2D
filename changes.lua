--[[Main.lua]]

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
	include("json.lua")
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




--[[Menu.lua]]

button2 = {}

function loggingDraw(username)
	if not usrbox then
		usrbox = loveframes.Create("frame")
		usrbox:SetName("Please write your username")
		usrbox:Center()
		button = loveframes.Create("button")
		button:SetWidth(200)
		button:Center()
	end
	button:SetText(username)
end

function menuDraw()
	if not menubox then
		menubox = loveframes.Create("frame")
		menubox:SetName("Menu")
		menubox:Center()
	end
end

function mainGUI()
	love.graphics.setColor(199,194,194)
	love.graphics.rectangle("fill", 0, 670, 1280, 50)
	for i,v in ipairs(button2) do
		love.graphics.setColor(88,87,87)
		love.graphics.setFont(title)
		love.graphics.print(v.text, v.x, v.y)
	end
end

function menuButton(x,y, text, id)
	table.insert(button2, {x = x, y = y, text = text, id = id})
end

function menuClick(x,y)
	for i,v in ipairs(button2) do
		if x > v.x and x < v.x + title:getWidth(v.text) and y > v.y and y < v.y + title:getHeight() then
			if v.id == "invest" then
				gamestate = "playing.invest"
			end
			if v.id == "account" then
				gamestate = "playing.account"
			end
			if v.id == "help" then
				gamestate = "playing.help"
			end
		end
	end
end



--[[investpage.lua]]

function investMenu()
	love.graphics.setColor(255,255,255)
	love.graphics.print("Investir", 30, 50)

	love.graphics.setColor(104,102,102)
	love.graphics.rectangle("fill", 30, 90, 550, 540)
	love.graphics.rectangle("fill", 610, 90, 540, 270)

	love.graphics.setColor(48,187,229)
	love.graphics.setFont(subtitle)
	love.graphics.print("Détails :", 615, 92)
end



--[[input.lua]]

function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
	menuClick(x,y)
end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	hook.Call("KeyPressed", nil, key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	loveframes.keyreleased(key)
end

function love.textinput(text)
	loveframes.textinput(text)
end



--[[issomething.lua]]

function isfunction(a)
	return type(a) == "function"
	--return true
end

function isstring(a)
	return type(a) == "string"
	--return true
end

function isnumber(a)
	return type(a) == "number"
end




--EOF
