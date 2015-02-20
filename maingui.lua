username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500

menuX = 0
menuY = 0

function mainGui()
	love.graphics.setColor(152,152,152)
	love.graphics.rectangle("fill", 980, 8, 280, 80)
	love.graphics.setFont(subtitle)
	love.graphics.setColor(235,62,9)
	love.graphics.print(username .. " - Niveau : " .. usrlevel, 10, 10)
	love.graphics.setColor(255,255,255)
	love.graphics.print("Infos joueur :", 982, 10)
	love.graphics.setFont(graphfont)
	love.graphics.print("Argent en compte : $" .. virtual_account_money, 982, 40)
	love.graphics.print("Croissance : ", 982, 60)
	if account_growth >= 0 then
		love.graphics.setColor(102,204,0)
	else
		love.graphics.setColor(204,0,0)
	end
	love.graphics.print(account_growth .. "%", 980 + graphfont:getWidth("Croissance : "), 60)
end

function menuOnClick(x,y, button)
	if menuX ~= 0 and menuY ~= 0 then
		if menuX ~= 0 and menuY ~= 0 and x > menuX and x < menuX + 200 and y > menuY and y < menuY + 135 then
			menuSelection(x,y,button)
		else
			menuBar:Remove()
			menuText1:Remove()
			menuText2:Remove()
			menuText3:Remove()
			menuX = 0
			menuY = 0
		end
	elseif menuX == 0 and menuY == 0 then
		drawMenu(x,y, button)
	end
end

function drawMenu(x,y,button)
	menuX = x
	menuY = y

	menuBar = loveframes.Create("image")
	menuBar:SetImage("ressources/menubar.png")
	menuBar:SetPos(x,y)

	menuText1 = loveframes.Create("text", menuBar)
	menuText1:SetFont(graphfont)
	menuText1:SetPos(x + 6, y + 11)
	menuText1:SetText("Investir..")

	menuText2 = loveframes.Create("text", menuBar)
	menuText2:SetFont(graphfont)
	menuText2:SetPos(x + 6, y + 31)
	menuText2:SetText("Se former..")

	menuText3 = loveframes.Create("text", menuBar)
	menuText3:SetFont(graphfont)
	menuText3:SetPos(x + 6, y + 51)
	menuText3:SetText("Vos actions..")
end

function menuSelection(x,y,button)
	if x < menuX + 6 + graphfont:getWidth("Investir..") and x > menuX + 6 and y < menuY + 11 + graphfont:getHeight() and y > menuY + 11 then
		investMenu()
	elseif x < menuX + 6 + graphfont:getWidth("Se former..") and x > menuX + 6 and y < menuY + 31 + graphfont:getHeight() and y > menuY + 31 then
		--learnMenu()
		menuText2:SetText("Wesh !")
	elseif x < menuX + 6 + graphfont:getWidth("Vos actions..") and x > menuX + 6 and y < menuY + 51 + graphfont:getHeight() and y > menuY + 51 then
		--actionsMenu()
		menuText3:SetText("Sexe lol !")
	end
end

function investMenu()
	investPage = loveframes.Create("image")
	investPage:SetImage("ressources/investpage.png")
	investPage:Center()
	quitButton = loveframes.Create("button", investPage)
	quitButton:SetText("X")
	quitButton:SetWidth(20)
	quitButton:SetHeight(20)
	quitButton:SetPos(1050, 100)
	quitButton.OnClick = function(object)
		investPage:Remove()
		quitButton:Remove()
	end
end