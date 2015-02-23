username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500

menuX = 0
menuY = 0


function menuOnClick(x,y, button)
	if menuX ~= 0 and menuY ~= 0 then
		if menuX ~= 0 and menuY ~= 0 and x > menuX and x < menuX + 200 and y > menuY and y < menuY + 135 then
			menuSelection(x,y,button)
			menuX = x
			menuY = y
		else
			menuBar:Remove()
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
end

function menuSelection(x,y,button)
	if x < menuX + 210 and x > menuX and y < menuY + 43 and y > menuY + 11 then
		investMenu()
	elseif x < menuX + 210 and x > menuX and y < menuY + 92 and y > menuY + 49 then
		seFormer(x,y,button)
	elseif x < menuX + 210 and x > menuX and y < menuY + 146 and y > menuY + 98 then
		--actionsMenu()
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