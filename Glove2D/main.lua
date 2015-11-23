local loader = require 'love-loader'
local finishedLoading = false
local screenWidth, screenHeight = love.graphics.getWidth(), love.graphics.getHeight()

require "data"
require "error"
ffi = require 'ffi'
require "ressources/fonts"
require "timersloop"
require "save"
require "events"
require "money"
require "clientsystem"
require "input"
require "quit"

instant_fps = 60


local TEST_ERROR = false


print(love.filesystem.read("exit.txt"))
if love.filesystem.read("exit.txt") ~= "false" then
	require "lua_ffi"
	--steamworks = require"steamworks/init"
end


local MAX_FPS = 200
local http;
local time = os.time()

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



customers = {}
emps = {}
backgroundpics = {}
local tmpfonts = {}



function love.load()


	loader.newImage(  backgroundpics, "blurrywall", "ressources/wallpoop.png")
	loader.newImage(  backgroundpics, "backgroundpic", "ressources/BackgroundMedium.png")
	loader.newImage(  backgroundpics, "backgroundpic2", "ressources/BackgroundOver.png")
	loader.newImage(  backgroundpics, "secretaryPic", "ressources/CharaSecretaryAnim1.png")
	loader.newImage(  backgroundpics, "comptoirPic", "ressources/ObjectCounter.png")
	loader.newImage(  backgroundpics, "bossPic", "ressources/CharaBankBoss.png")
	loader.newImage(  backgroundpics, "secu2Pic", "ressources/CharaGuardians2.png")
	loader.newImage(  backgroundpics, "secu3Pic", "ressources/CharaGuardians3.png")
	loader.newFont(_G, 'date_box_text1' ,"ressources/OpenSans-Regular.ttf", 18)
	loader.newFont(_G, 'date_box_text2' ,"ressources/OpenSans-Regular.ttf", 15)
	loader.newFont(_G, 'rightclickmenu' ,"ressources/OpenSans-Regular.ttf", 25)
	loader.newFont(_G, 'popuptext' ,"ressources/OpenSans-Regular.ttf",20)
	loader.newFont(_G, 'cashtext' , "ressources/OpenSans-Regular.ttf",17)
	loader.newFont(_G, 'popuptitle' ,"ressources/OpenSans-Semibold.ttf", 25)
	loader.newFont(_G, 'sliderbarfont' ,"ressources/OpenSans-Semibold.ttf", 15)
	loader.newFont(_G, 'fluwtext' ,"ressources/OpenSans-Regular.ttf",7)
	loader.newFont(_G, 'fluwtexttuto' ,"ressources/OpenSans-Regular.ttf",10)
	loader.newFont(_G, 'titletext' ,"ressources/Calibri.ttf",17)
	loader.newFont(_G, 'postittext' ,"ressources/Calibri.ttf",13)
	loader.newFont(_G, 'datebox' ,"ressources/Calibri.ttf",19)

	loader.start(function()
    	finishedLoading = true

    	love.graphics.setBackgroundColor( 255,245,217 )
		load_modules()
		love.graphics.setPointStyle('smooth')
		love.graphics.setLineStyle('smooth')
		love.graphics.setLineWidth(0.2)
		init_restore()
		

		local theme = love.audio.newSource("ressources/theme.mp3", "static")


		theme:setVolume(0.1)
		theme:setPitch(1)
		theme:setLooping(true)
		
		require "background"
  	end)

	loveframes = require("gui")
	--theme:play()
	--CreatePopUp("News test","Ceci est un test avec le nouveau \ndesign, il manque pas les boutons",nil)
	require "maingui"


	love.filesystem.write("exit.txt", "false")
end


function love.update(dt)
  if not finishedLoading then
    loader.update() -- You must do this on each iteration until all resources are loaded
  end

--	ffi.C.Sleep(1000/MAX_FPS)
	if not PAUSED then
		loveframes.update(dt)
		hook.Call("Think", dt)
		timer.check()
	end
	hook.Call("ThinkUnpaused", dt)
	leftClick = love.mouse.isDown("l")
	instant_fps = 1/dt
end


function love.timer.realFPS()
	return instant_fps
end


function love.draw()

	if finishedLoading then
		hook.Call("BackBackGround") -- the real one .... this time eheh
		hook.Call("BackGroundDraw") -- wallpaper ?
		hook.Call("Draw")
		loveframes.draw()
		hook.Call("DrawOverFrame")
		hook.Call("OverLayDraw") -- Menu echap, par exemple
	else
		  local separation = 30;
		  local w = screenWidth - 2*separation
		  local h = 50;
		  local x,y = separation, screenHeight - separation - h;
		love.graphics.rectangle("line", x, y, w, h)

		x, y = x + 3, y + 3
		w, h = w - 6, h - 7

		if loader.loadedCount > 0 then
			w = w * (loader.loadedCount / loader.resourceCount)
		else 
			w = 0
		end
		love.graphics.rectangle("fill", x, y, w, h)

	end
end

function love.resize(w, h)
	ScrW = w
	ScrH = h
end



hook.Add("SaveRestored", "HUDPAINTRESTORED", function()
	hook.Add("BackGroundDraw", "Infos background", function()
		DrawDateBox()
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), ScrW*10/1280 ,50)
		--love.graphics.print("X,Y,Z debug:"..tostring(x)..", "..tostring(y)..", "..tostring(z), 200,700)
		--love.graphics.print("D,M,Y debug:"..tostring(T_DAY)..", "..tostring(T_MONTH)..", "..tostring(T_YEAR), 600,700)
		--love.graphics.print("Salaire: "..tostring(Salary) or "nul", 300, 0)
		--love.graphics.print("Popularité:"..tostring(Popularity) or "nul", 600,700)
		--love.graphics.print('Memory actually used (in kB): ' .. math.Round(collectgarbage('count')), ScrW*900/1280,ScrH-50)
		--love.graphics.print("Engouement : " .. engouement, ScrW*200/1280,ScrH-50)
		--love.graphics.print("Réputation : " .. reputation, ScrW*400/1280, ScrH-50)
		--love.graphics.print("taux concurrent 1, 2, 3 : ".. tauxConcurrent1Crediteur.." ; ".. tauxConcurrent2Crediteur.. " ; ".. tauxConcurrent3Crediteur, 300, 0)
		--love.graphics.print("crisisIndicator : "..crisisIndicator,300,30)
	if TEST_ERROR then
		error("lol")
	end

	end)
end)
