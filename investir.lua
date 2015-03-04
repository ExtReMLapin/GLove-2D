
	 dureeInvestisseurMin =nil 
	 dureeInvestisseurMax =nil
	 remunerationInvestisseurMin = nil
	 remunerationInvestisseurMax =nil 

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

function investisseurMenu()
	IsOnDesktop = false

	local principaleFrame = loveframes.Create("frame")
	principaleFrame:SetName("Menu Investisseur"):SetSize(800, 600):Center():SetDraggable(false)
	principaleFrame:ShowCloseButton(false)
	principaleFrame.OnClose = function(object)
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end

	local sliderForm1 = loveframes.Create("form", principaleFrame)
	sliderForm1:SetPos(35, 130):SetSize(315, 200):SetName("Maturité (durée d'investissement)")
		courtTerme = loveframes.Create("text", principaleFrame)
		courtTerme:SetText("Court terme:					 Mois ou inferieur"):SetPos(45, 175)
		courtTermeValue = loveframes.Create("textinput", principaleFrame)
		courtTermeValue:SetPos(140, 170):SetSize(60,20)
		moyenTerme = loveframes.Create("text", principaleFrame)
		moyenTerme:SetText("Moyen terme:					Mois ou inferieur"):SetPos(45, 225)
		moyenTermeValue = loveframes.Create("textinput", principaleFrame)
		moyenTermeValue:SetPos(140, 220):SetSize(60,20)
		longTerme = loveframes.Create("text", principaleFrame)
		longTerme:SetText("Long terme:  				     Mois ou supérieur"):SetPos(45, 275)
		longTermeValue = loveframes.Create("textinput", principaleFrame)
		longTermeValue:SetPos(140, 270):SetSize(60,20)


	local sliderForm2 = loveframes.Create("form", principaleFrame)
	sliderForm2:SetPos(390, 130):SetSize(315, 200):SetName("Somme investie")
		faibleInvest = loveframes.Create("text", principaleFrame)
		faibleInvest:SetText("Faible invest. :					F ou inférieur"):SetPos(400,175)
		faibleInvestValue = loveframes.Create("textinput", principaleFrame)
		faibleInvestValue:SetPos(495,170):SetSize(60,20)
		moyenInvest = loveframes.Create("text", principaleFrame)
		moyenInvest:SetText("Moyen invest. :				   F ou inférieur"):SetPos(400,225)
		moyenInvestValue = loveframes.Create("textinput", principaleFrame)
		moyenInvestValue:SetPos(495,220):SetSize(60,20)
		fortInvest = loveframes.Create("text", principaleFrame)
		fortInvest:SetText("Fort invest. :					   F ou inférieur"):SetPos(400,275)
		fortInvestValue = loveframes.Create("textinput", principaleFrame)
		fortInvestValue:SetPos(495,270):SetSize(60,20)


-------------------------------------------------------------------------------
	local secondaryFrame = loveframes.Create("frame")
	secondaryFrame:ShowCloseButton(false)
	secondaryFrame:SetName("Choix préconfig"):SetSize(200, 400):SetPos(40, 160):SetDraggable(false)
	local checkboxPreconfig1 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig1:SetText("Sécurité")
	checkboxPreconfig1:SetPos(15, 50)
	checkboxPreconfig2 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig2:SetText("Equilibré")
	checkboxPreconfig2:SetPos(15, 80)
	checkboxPreconfig3 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig3:SetText("Indifférent")
	checkboxPreconfig3:SetPos(15, 110)
	checkboxPreconfig4 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig4:SetText("Personnalisé")
	checkboxPreconfig4:SetPos(15, 140)

	local savePresetButton = loveframes.Create("button", principaleFrame)
	savePresetButton:SetText("Enregistrer"):SetPos(270,560)
	savePresetButton.OnClick = function()
		--enregistrer les presets
		principaleFrame:Remove()
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
		love.mouse.setCursor( c_arrow )
	end
	local cancelPresetButton = loveframes.Create("button", principaleFrame)
	cancelPresetButton:SetText("Annuler"):SetPos(395,560)
	cancelPresetButton.OnClick = function()
		principaleFrame:Remove()
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
		love.mouse.setCursor( c_arrow )
	end
end











---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------PUTAING DE TABARNAK DE--------------
----------------BUDGET DE MERDE KEK----------------
---------------------------------------------------
---------------------------------------------------



function budgetMenu()










end





