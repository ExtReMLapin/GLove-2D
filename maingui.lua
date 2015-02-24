username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500
local principalMenuX = 0
local principalMenuY = 0

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
	local gamestate1;
	if introBox then return "tutorial" end

	if realX > principalMenuX + 212 and realX < principalMenuX + 412 and realY > principalMenuY and realY < principalMenuY + 44 then
		gamestate1 = "seformer.lexique"
	elseif realX > principalMenuX + 212 and realX < principalMenuX + 412 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
		gamestate1 = "seformer.type"
	elseif realX > principalMenuX + 212 and realX < principalMenuX + 412 and realY > principalMenuY + 102 and realY < principalMenuY + 146 then
		gamestate1 = "seformer.actu"
	elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
	else
		gamestate1 = "playing"
	end

	if realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY and realY < principalMenuY + 44 then
			--investirMenu()
			gamestate1 = "investir"
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
			gamestate1 = "se former"
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 102 and realY < principalMenuY + 146 then
			--listeactionsMenu()
			gamestate1 = "liste actions"
	end
	_gamestate = gamestate1;
	return gamestate1 or "tutorial"

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
		if realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY and realY < principalMenuY + 44 then
			--investirMenu()
			gamestate1 = "investir"
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 51 and realY < principalMenuY + 95 then
			gamestate1 = "se former"
		elseif realX > principalMenuX and realX < principalMenuX + 210 and realY > principalMenuY + 102 and realY < principalMenuY + 146 then
			--listeactionsMenu()
			gamestate1 = "liste actions"
		else
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