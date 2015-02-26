require "menu"
require "input"
require "investpage"
require "accountpage"
require "helppage"

local loaded = {}
local i = 1
local http;

LOAD_STATUS = 0

-- cursors
c_appstarting = love.mouse.getSystemCursor('wait')
c_default = love.mouse.getSystemCursor('arrow')
c_ibeam = love.mouse.getSystemCursor('ibeam')
c_hand = love.mouse.getSystemCursor('hand')
c_size = love.mouse.getSystemCursor("sizeall")

Msg = io.write;
gamestate = "playing.account"
Globalcorpname = "AAPL"

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
	--debug.debug()
	love.graphics.setBackgroundColor(232,235,239)
	love.filesystem.setIdentity( "GLove-2D" )
	title = love.graphics.newFont("ressources/Ubuntu-B.ttf", 27)
	subtitle = love.graphics.newFont("ressources/Ubuntu-B.ttf",23)
	other_text = love.graphics.newFont("ressources/FuturaExtended.ttf", 18)
	graphfont = love.graphics.newFont(12)
	menuButton(150, 680, "Investir", "invest")
	menuButton(510, 680, "Mon Compte Virtuel", "account")
	menuButton(1000, 680, "Aide", "help")
	hook.Add("KeyPressed", "loggin", gamestate_loggin)
	love.graphics.setPointStyle('smooth')
	love.graphics.setLineStyle('smooth')
	love.graphics.setLineWidth(2)
	init_restore()
	accountBought()
	--precachedata()
	do return end
	for k, v in pairs(Brand) do
		bank.corpo_get_value_date(v.Name)
		bank.corpo_get_infos(v.Name)
		bank.GetPrice(v.Name)
		LOAD_STATUS = k
	end



end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
	timer.check()
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
		helpDraw()
	end
	mainGUI()
end