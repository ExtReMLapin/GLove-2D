
	 dureeInvestisseurMin =nil 
	 dureeInvestisseurMax =nil
	 remunerationInvestisseurMin = nil
	 remunerationInvestisseurMax =nil 
	 prixPublicite = 0

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

	--[[local sliderp1 = loveframes.Create("slider", principaleFrame)
	sliderp1:SetPos(300, 300)
	
	sliderp1:SetWidth(290)
	sliderp1:SetMinMax(0, 100)
	sliderp1:SetValue(100)
	sliderp1.OnValueChanged = function(object)
		slider1 = object:GetValue()
	end

		local sliderp2 = loveframes.Create("slider", principaleFrame)
	sliderp2:SetPos(300, 320)
	sliderp2:SetWidth(290)
	sliderp2:SetMinMax(0, 100)
	sliderp2:SetValue(100)
	sliderp2.OnValueChanged = function(object)
		slider2 = object:GetValue()
	end

		local sliderp3 = loveframes.Create("slider", principaleFrame)
	sliderp3:SetPos(300, 340)
	sliderp3:SetWidth(290)
	sliderp3:SetMinMax(0, 100)
	sliderp3:SetValue(100)
	sliderp3.OnValueChanged = function(object)
		slider3 = object:GetValue()
	end


		local sliderp4 = loveframes.Create("slider", principaleFrame)
	sliderp4:SetPos(300, 360)
	sliderp4:SetWidth(290)
	sliderp4:SetMinMax(0, 100)
	sliderp4:SetValue(100)
	sliderp4.OnValueChanged = function(object)
		slider4 = object:GetValue()
	end--]]



	local button1 = loveframes.Create("button", principaleFrame)
		button1.shouldtrack = false
		button1:SetWidth(10)
		button1:SetPos(210+slider1-5,180)
		button1.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			object.shouldtrack = true

		end
		button1.OnMouseExit = function(object)
			object.shouldtrack = false
			love.mouse.setCursor( c_arrow )
		end


			local button2 = loveframes.Create("button", principaleFrame)
		button2.shouldtrack = false
		button2:SetWidth(10)
		button2:SetPos(210+slider1+slider2-5,180)
		button2.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			object.shouldtrack = true

		end
		button2.OnMouseExit = function(object)
			object.shouldtrack = false
			love.mouse.setCursor( c_arrow )
		end


			local button3 = loveframes.Create("button", principaleFrame)
		button3.shouldtrack = false
		button3:SetWidth(10)
		button3:SetPos(210+slider1+slider2+slider3-5,180)
		button3.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			object.shouldtrack = true

		end
		button3.OnMouseExit = function(object)
			object.shouldtrack = false
			love.mouse.setCursor( c_arrow )
		end




			local button4 = loveframes.Create("button", principaleFrame)
		button4.shouldtrack = false
		button4:SetWidth(10)
		button4:SetPos(210+slider1+slider2+slider3+slider4-5,180)
		button4.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			object.shouldtrack = true

		end
		button4.OnMouseExit = function(object)
			object.shouldtrack = false
			love.mouse.setCursor( c_arrow )
		end



	--[[		local button5 = loveframes.Create("button", principaleFrame)
		button5.shouldtrack = false
		button5:SetWidth(200)
		button5:SetPos(450+slider1)
		button5.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			object.shouldtrack = true

		end
		button5.OnMouseExit = function(object)
			object.shouldtrack = false
			love.mouse.setCursor( c_arrow )
		end]]




	hook.Add("OverLayDraw", "Slidertest", function()
			local MOUSE_X = love.mouse.getPosition( )	
			love.graphics.setColor(0,0,0,255)
			love.graphics.rectangle( "fill", 450,250 ,slider1,20 )
			love.graphics.setColor(50,255,50,255)
			love.graphics.rectangle( "fill", 450+slider1,250 ,slider2,20 )
			love.graphics.setColor(255,100,50,255)
			love.graphics.rectangle( "fill", 450+slider1+slider2,250 ,slider3,20 )
			love.graphics.setColor(50,100,250,255)
			love.graphics.rectangle( "fill", 450+slider1+slider2+slider3,250 ,slider4,20 )
			love.graphics.setColor(0,0,150,255)
			love.graphics.rectangle( "fill", (slider1+slider2+slider3+slider4+450),250 ,math.Max(0,950-(slider1+slider2+slider3+slider4+450)),20 )


			if leftClick then

				if button1.shouldtrack == true then
					button1:SetPos(MOUSE_X-245, 180)
					slider1 = button1:GetX()-445
					button2:SetPos(210+slider1+slider2-5,180)
					button3:SetPos(210+slider1+slider2+slider3-5,180)
					button4:SetPos(math.Min(945,210+slider1+slider2+slider3+slider4-5),180)
				end
				if button2.shouldtrack == true then
					button2:SetPos(MOUSE_X-245, 180)
					slider2 = button2:GetX()-445-slider1
					button3:SetPos(210+slider1+slider2+slider3-5,180)
					button4:SetPos(math.Min(945-210,210+slider1+slider2+slider3+slider4-5),180)
				end

				if button3.shouldtrack == true then
					button3:SetPos(MOUSE_X-245, 180)
					slider3 = button3:GetX()-445-slider1-slider2
					button4:SetPos(math.Min(945,210+slider1+slider2+slider3+slider4-5),180)
				end

				if button4.shouldtrack == true then
					button4:SetPos(math.Min(945,MOUSE_X)-245, 180)
					slider4 = button4:GetX()-445-slider1-slider2-slider3
				end




			end


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
	local currentMonth = T_MONTH
	local currentYear = T_YEAR
	
	budgetFrame = loveframes.Create("frame")
	budgetFrame:SetSize(800,600):Center():SetName("Menu budget"):ShowCloseButton(false)

	pubForm = loveframes.Create("form", budgetFrame)
	pubForm:SetPos(20,90):SetSize(300, 170):SetName("Créer une campagne pubicitaire")
	pubData = loveframes.Create("text", budgetFrame)
	pubData:SetPos(30, 160):SetText("Coût de la campagne : \nTemps d'attente : \nGain de popularité :")
	pubMultichoice = loveframes.Create("multichoice", budgetFrame)
	pubMultichoice:SetPos(25,105):AddChoice("Prospectus"):AddChoice("Presse"):AddChoice("Don")
	pubMultichoice.OnChoiceSelected = function(object,choice)
		if choice == "Prospectus" then
			prixPublicite = 8000
			attentePublicite = 92
			popularitePublicite = 3
		elseif choice == "Presse" then
			prixPublicite = 20000
			attentePublicite = 31
			popularitePublicite = 8
		elseif choice == "Don" then
			prixPublicite = 150000
			attentePublicite = 14
			popularitePublicite = 15
		end
		pubData:SetText("Coût de la campagne : ".. prixPublicite.."F\nTemps d'attente : "..attentePublicite.." Jours\nGain de popularité : +"..popularitePublicite)
	end
	pubAcheter = loveframes.Create("button", budgetFrame)
	pubAcheter:SetPos(230, 227):SetText("Créer")
	pubAcheter.OnClick = function(object)
		Popularity = Popularity + popularitePublicite
		addMoney(-prixPublicite,"Campagne publicitaire")
		--createEvent(string.format("%i%i", ))
	end	
---------------------------------------------------------------------------------------------------------
	employeeManagementForm = loveframes.Create("form", budgetFrame)
	employeeManagementForm:SetPos(20,280):SetSize(300,170):SetName("Gestion du personnel")
	employeeManagementText = loveframes.Create("text", budgetFrame)
	employeeManagementText:SetPos(30,320):SetText("Nombre d'employés : "..nbEmployees)
	employeeManagementNumberbox = loveframes.Create("numberbox",budgetFrame)
	employeeManagementNumberbox:SetPos(170,420):SetMinMax(1,nbEmployees):SetIncreaseAmount(1):SetWidth(60):SetValue(1):SetHeight(25)
	employeeManagementButton = loveframes.Create("button", budgetFrame)
	employeeManagementButton:SetPos(230,420)
	employeeManagementButton.OnClick = function(object)
		if employeeManagementMultichoice:GetChoice() == "Recruter" then
			nbEmployees = nbEmployees + employeeManagementNumberbox:GetValue()
			Popularity = Popularity + employeeManagementNumberbox:GetValue()
		elseif employeeManagementMultichoice:GetChoice() == "Licencier" then
			nbEmployees = nbEmployees - employeeManagementNumberbox:GetValue()
			Popularity = Popularity - employeeManagementNumberbox:GetValue()
		end
	end

	employeeManagementMultichoice = loveframes.Create("multichoice", budgetFrame)
	employeeManagementMultichoice:SetPos(25,295):AddChoice("Recruter"):AddChoice("Licencier")
	employeeManagementMultichoice.OnChoiceSelected = function(object,choice)
		employeeManagementButton:SetText(choice)
		if choice == "Recruter" then employeeManagementText:SetText("Nombre d'employés : "..nbEmployees.."\nCoût sup. : "..(employeeManagementNumberbox:GetValue() * Salary).."F")
	end end

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





