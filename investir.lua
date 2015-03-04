
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


	local slider1 = 100
	local slider2 = 100
	local slider3 = 100
	local slider4 = 100

	local sliderp1 = loveframes.Create("slider", frame)
	sliderp1:SetPos(300, 300)
	sliderp1:SetWidth(290)
	sliderp1:SetMinMax(0, 100)
	sliderp1.OnValueChanged = function(object)
		slider1 = object:GetValue()
	end

		local sliderp2 = loveframes.Create("slider", frame)
	sliderp2:SetPos(300, 320)
	sliderp2:SetWidth(290)
	sliderp2:SetMinMax(0, 100)
	sliderp2.OnValueChanged = function(object)
		slider2 = object:GetValue()
	end

		local sliderp3 = loveframes.Create("slider", frame)
	sliderp3:SetPos(300, 340)
	sliderp3:SetWidth(290)
	sliderp3:SetMinMax(0, 100)
	sliderp3.OnValueChanged = function(object)
		slider3 = object:GetValue()
	end


		local sliderp4 = loveframes.Create("slider", frame)
	sliderp4:SetPos(300, 360)
	sliderp4:SetWidth(290)
	sliderp4:SetMinMax(0, 100)
	sliderp4.OnValueChanged = function(object)
		slider4 = object:GetValue()
	end

	hook.Add("OverLayDraw", "Slidertest", function()

			love.graphics.setColor(0,0,0,255)
			love.graphics.rectangle( "fill", 450,250 ,slider1,20 )
			love.graphics.setColor(50,255,50,255)
			love.graphics.rectangle( "fill", 450+slider1,250 ,slider2,20 )
			love.graphics.setColor(255,100,50,255)
			love.graphics.rectangle( "fill", 450+slider1+slider2,250 ,slider3,20 )
			love.graphics.setColor(50,100,250,255)
			love.graphics.rectangle( "fill", 450+slider1+slider2+slider3,250 ,slider4,20 )
			love.graphics.setColor(0,0,150,255)
			love.graphics.rectangle( "fill", (slider1+slider2+slider3+slider4+450),250 ,950-(slider1+slider2+slider3+slider4+450),20 )


	end)







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
	IsOnDesktop = false
	local PubSave = Pub
	budgetFrame = loveframes.Create("frame")
	budgetFrame:SetSize(800,600):Center():SetName("Menu budget"):ShowCloseButton(false)

	pubSliderForm = loveframes.Create("form", budgetFrame)
	pubSliderForm:SetPos(20,130):SetSize(430, 50):SetName("Budget Hebdomadaire publicitaire")
	pubSliderText = loveframes.Create("text", budgetFrame)
	pubSliderText:SetText(Pub.."F"):SetPos(360, 153)
	pubSlider = loveframes.Create("slider", budgetFrame)
	pubSlider:SetMinMax(0, math.Round(Money / 500)):SetPos(30, 150):SetWidth(300):SetValue(0):SetDecimals(0):SetValue(PubSave)
	pubSlider.OnValueChanged = function(object)
		Pub = pubSlider:GetValue()
		pubSliderText:SetText(tostring(pubSlider:GetValue()).."F")
		pubBudgetRecap2:SetText(tostring(string.nicemath(Pub)).."F\n"..tostring(string.nicemath(Pub * 4)).."F\n"..tostring(string.nicemath(Pub * 52)).."F")

	end
	budgetRecapForm = loveframes.Create("form", budgetFrame)
	budgetRecapForm:SetPos(270, 385):SetSize(230,60):SetName("Récapitulatif")
	pubBudgetRecap1 = loveframes.Create("text", budgetFrame)
	pubBudgetRecap1:SetText("Budget hebdomadaire : \nBudget mensuel : \nBudget annuel :"):SetPos(280, 400)
	pubBudgetRecap2 = loveframes.Create("text", budgetFrame)
	pubBudgetRecap2:SetPos(433, 400):SetText(tostring(PubSave).."F\n"..tostring(string.nicemath(PubSave * 4)).."F\n"..tostring(string.nicemath(PubSave * 52)).."F")
	saveBudgetButton = loveframes.Create("button", budgetFrame)
	saveBudgetButton:SetText("Enregistrer"):SetPos(325,560)
	saveBudgetButton.OnClick = function(object)
		budgetFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end
	cancelBudgetButton = loveframes.Create("button", budgetFrame)
	cancelBudgetButton:SetText("Annuler"):SetPos(475, 560)
	cancelBudgetButton.OnClick = function(object)
		Pub = PubSave
		budgetFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end
end





