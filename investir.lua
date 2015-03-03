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
	local dureeInvestisseurMin = 14
	local dureeInvestisseurMax = 220
	local remunerationInvestisseur
	principaleFrame = loveframes.Create("frame")
	principaleFrame:SetName("Menu Investisseur"):SetSize(800, 600):Center()
	principaleFrame.OnClose = function(object)
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end
	sliderForm1 = loveframes.Create("form", principaleFrame)
	sliderForm1:SetPos(35, 130):SetSize(315, 50):SetName("Durée minimale d'investissement")
	sliderForm2 = loveframes.Create("form", principaleFrame)
	sliderForm2:SetPos(390, 130):SetSize(315, 50):SetName("Durée maximale d'investissement")
	sliderInvestisseur1 = loveframes.Create("slider", principaleFrame)
	sliderInvestisseur1:SetSize(300,275):SetPos(40, 150):SetValue(1,240)
	sliderInvestisseur1.OnValueChange = function(object)
		dureeInvestisseurMin = sliderInvestisseur1:GetValue()
	end
	sliderInvestisseur2 = loveframes.Create("slider", principaleFrame)
	sliderInvestisseur2:SetSize(300,275):SetPos(395, 150):SetValue(1,240)
	sliderInvestisseur2.OnValueChange = function(object)
		dureeInvestisseurMax = sliderInvestisseur2:GetValue()
	end
	sliderForm3 = loveframes.Create("form", principaleFrame)
	sliderForm3:SetPos(35, 230):SetSize(315, 50):SetName("Rendement de la durée minimale")
	sliderForm4 = loveframes.Create("form", principaleFrame)
	sliderForm4:SetPos(390, 230):SetSize(315, 50):SetName("Rendement de la durée maximale")
	sliderInvestisseur1 = loveframes.Create("slider", principaleFrame)
	sliderInvestisseur1:SetSize(300,275):SetPos(40, 250):SetValue(1,240)
	sliderInvestisseur1.OnValueChange = function(object)
		dureeInvestisseurMin = sliderInvestisseur1:GetValue()
	end
	sliderInvestisseur2 = loveframes.Create("slider", principaleFrame)
	sliderInvestisseur2:SetSize(300,275):SetPos(395, 250):SetValue(1,240)
	sliderInvestisseur2.OnValueChange = function(object)
		dureeInvestisseurMax = sliderInvestisseur2:GetValue()
	end
	formMoneyOrigin = loveframes.Create("form", principaleFrame)
	formMoneyOrigin:SetSize(315,50):SetName("Origine de l'investissement"):SetPos(35,380)
	checkboxMoneyOrigin1 = loveframes.Create("checkbox", principaleFrame)
	checkboxMoneyOrigin1:SetText("Légale")
	checkboxMoneyOrigin1:SetPos(40, 400)
	checkboxMoneyOrigin2 = loveframes.Create("checkbox", principaleFrame)
	checkboxMoneyOrigin2:SetText("Douteuse")
	checkboxMoneyOrigin2:SetPos(140, 400)
	checkboxMoneyOrigin3 = loveframes.Create("checkbox", principaleFrame)
	checkboxMoneyOrigin3:SetText("Indifférent")
	checkboxMoneyOrigin3:SetPos(240, 400)
-------------------------------------------------------------------------------
	secondaryFrame = loveframes.Create("frame")
	secondaryFrame:SetName("Choix préconfig")
	secondaryFrame:SetSize(200, 400)
	secondaryFrame:SetPos(40, 160)
	checkboxPreconfig1 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig1:SetText("Sécurité")
	checkboxPreconfig1:SetPos(15, 50)
	checkboxPreconfig2 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig2:SetText("Equilibré")
	checkboxPreconfig2:SetPos(15, 80)
	checkboxPreconfig3 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig3:SetText("Indifférent")
	checkboxPreconfig3:SetPos(15, 110)
	checkboxPreconfig3 = loveframes.Create("checkbox", secondaryFrame)
	checkboxPreconfig3:SetText("Personnalisé")
	checkboxPreconfig3:SetPos(15, 140)

	savePresetButton = loveframes.Create("button", principaleFrame)
	savePresetButton:SetText("Enregistrer"):SetPos(270,560)
	savePresetButton.OnClick = function()
		--enregistrer les presets
		principaleFrame:Remove()
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end
	cancelPresetButton = loveframes.Create("button", principaleFrame)
	cancelPresetButton:SetText("Annuler"):SetPos(395,560)
	cancelPresetButton.OnClick = function()
		principaleFrame:Remove()
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end
end
 