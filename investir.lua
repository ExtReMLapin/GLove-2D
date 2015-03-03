function investirMenu()
	local posX, poxY
	IsOnDesktop = false
	local investirButton = {}
	local boxes
	menuInvestir = loveframes.Create("image")
	menuInvestir:SetImage("ressources/investirmenu.png")
	menuInvestir:Center()
	if T_YEAR < 1870 then boxes = 8 elseif T_YEAR >= 1870 and T_YEAR < 1890 then boxes = 18 else boxes = 23 end
	for i = 1, 23 do
		investirButton[i] = loveframes.Create("button", menuInvestir)
		if i <= boxes then investirButton[i]:SetText(Sectors[i]) else investirButton[i]:SetText("?") end
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
		if i <= boxes then
			investirButton[i].OnClick = function(object)
				clickedButton = investirButton[i]:GetText()
			end
		else
			investirButton[i]:SetClickable(false)
		end
	end
	quitCross = loveframes.Create("text", menuInvestir)
	quitCross:SetFont(title)
	quitCross:SetText("X")
	quitCross:SetPos(1060, 70)
	quitCross.OnClick = function(object)
		unpausetime()
		IsOnDesktop = true
		menuInvestir:Remove()
		for j = 1, 23 do investirButton[j]:Remove() end
		quitCross:Remove()

	end
end

