function investirMenu()
	local posX, poxY
	local investirButton = {}
	menuInvestir = loveframes.Create("image")
	menuInvestir:SetImage("ressources/investirmenu.png")
	menuInvestir:Center()
	for i = 1, 24 do
		investirButton[i] = loveframes.Create("button", menuInvestir)
		investirButton[i]:SetText(Sectors[i])
		investirButton[i]:SetWidth(150)
		if i == 1 then
			investirButton[i]:SetPos(300, 150)
			posX = 300
			posY = 150
		elseif i % 2 == 0 then
			investirButton[i]:SetPos(posX + 160, posY)
			posX = posX + 160
		elseif i % 2 > 0 then
			investirButton[i]:SetPos(posX - 160, posY + 30)
			posX = posX - 160
			posY = posY + 30
		end
		investirButton[i].OnClick = function(object)
			clickedButton = investirButton[i]:GetText()
		end
	end
	quitCross = loveframes.Create("text", menuInvestir)
	quitCross:SetFont(title)
	quitCross:SetText("X")
	quitCross:SetPos(1060, 70)
	quitCross.OnClick = function(object)
		menuInvestir:Remove()
		for j = 1, 24 do investirButton[j]:Remove() end
		quitCross:Remove()
	end
end