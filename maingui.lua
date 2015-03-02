username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500
local principalMenuX = 0
local principalMenuY = 0
Brand = {}
	Brand[1] = {}
	Brand[2] = {}
	Brand[3] = {}
	Brand[4] = {}
	Brand[5] = {}
	Brand[6] = {}
	Brand[7] = {}
	Brand[8] = {}

	Brand[1].Name = "AMD"
	Brand[1].rn = "AMD"
	Brand[2].Name = "NVIDIA"
	Brand[2].rn = "NVDA"
	Brand[3].Name = "INTEL"
	Brand[3].rn = "INTC"
	Brand[4].Name = "Netflix"
	Brand[4].rn = "NFLX"
	Brand[5].Name = "Apple"
	Brand[5].rn = "AAPL"
	Brand[6].Name = "Facebook"
	Brand[6].rn = "Facebook"
	Brand[7].Name = "Microsoft"
	Brand[7].rn = "MSFT"
	Brand[8].Name = "Google"
	Brand[8].rn = "GOOGL"

function playerInfos()
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
end


function gamestate(realX, realY)
	if introBox then return "tutorial" end

	if _gamestate == "se former" then
		if realX > principalMenuX + 212 and realX < principalMenuX + 412 and realY > principalMenuY and realY < principalMenuY + 44 then
			_gamestate = "seformer.lexique"
		elseif realX > principalMenuX + 212 and realX < principalMenuX + 412 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
			_gamestate = "seformer.type"
		elseif realX > principalMenuX + 212 and realX < principalMenuX + 412 and realY > principalMenuY + 102 and realY < principalMenuY + 146 then
			_gamestate = "seformer.actu"
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
		else
			menuFormer:Remove()
			_gamestate = "playing"
		end

	elseif _gamestate == "playing" then
		if realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY and realY < principalMenuY + 44 then
			_gamestate = "investir"
			investirMenu()
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
			_gamestate = "se former"
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 102 and realY < principalMenuY + 146 then
			--listeactionsMenu()
			_gamestate = "liste actions"
		else
			_gamestate1 = "playing"
		end

	elseif _gamestate == "investir" then
		if realX > 1060 and realX < 1080 and realY > 72 and realY < 91 then
			menuInvestir:Remove()
			investirChoice:Remove()
			_gamestate = "playing"
		end
	end

	return _gamestate
end


function principalMenu(realX,realY)
	local gamestate1;
	if principalMenuX == 0 and principalMenuY == 0 then
		principalMenuX = realX
		principalMenuY = realY
		menuPrincip = loveframes.Create("image")
		menuPrincip:SetImage("ressources/menubar.png")
		menuPrincip:SetPos(realX,realY)
	elseif principalMenuX ~= 0 and principalMenuY ~= 0 then
		if (realX < principalMenuX or realX > principalMenuX + 210) or (realY < principalMenuY or realY > principalMenuY + 146) and _gamestate == "playing" then
			principalMenuY = 0
			principalMenuX = 0
			menuPrincip:Remove()			
		end
	end
end

function seformerMenu(realX,realY)
	menuFormer = loveframes.Create("image")
	menuFormer:SetImage("ressources/formerbar.png")
	menuFormer:SetPos(principalMenuX + 212,principalMenuY)
end

function investirMenu()
	menuInvestir = loveframes.Create("image")
	menuInvestir:SetImage("ressources/investirmenu.png")
	menuInvestir:Center()
	investirChoice = loveframes.Create("multichoice", menuInvestir)
	investirChoice:SetPos(220,130)
	for k, v in pairs(Brand) do
		investirChoice:AddChoice(v.Name)
	end
end