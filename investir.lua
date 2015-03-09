
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
	local dureeInvestisseurMin = 14
	local dureeInvestisseurMax = 220
	local remunerationInvestisseur
	principaleFrame = loveframes.Create("frame")
	principaleFrame:SetName("Menu Investisseur"):SetSize(800, 600):Center():ShowCloseButton(false)
	principaleFrame.OnClose = function(object)
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end

	form1Investisseur = loveframes.Create("form",principaleFrame)
	form1Investisseur:SetPos(50,90):SetSize(310,400):SetName("Règlage des investissements")

		text1Investisseur = loveframes.Create("text",principaleFrame)
		text1Investisseur:SetPos(60,150):SetText("Investissement minimum :\t\t\t\t\t\t    F\n\n\n\n\n\n\nInvestissement moyen :\t\t\t\t\t\t\t   F\n\n\n\n\n\n\nInvestissement élevé :\t\t\t\t\t\t\t\t F\n\n\n\n\n\n\nInvestissement maximum :\t\t\t\t\t\t   F")
		text2Investisseur = loveframes.Create("text",principaleFrame)
		text2Investisseur:SetPos(80,195):SetText("- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :")

		textinput1Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput1Investisseur:SetPos(250, 145):SetWidth(80):SetText("100000")
		textinput1Investisseur.OnEnter = function(object,text)
			minimalInvestment = tonumber(text)
		end
		textinput2Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput2Investisseur:SetPos(250, 240):SetWidth(80):SetText("800000")
		textinput2Investisseur.OnEnter = function(object,text)
			middle1Investment = tonumber(text)
		end
		textinput3Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput3Investisseur:SetPos(250,340):SetWidth(80):SetText("8000000")
		textinput3Investisseur.OnEnter = function(object,text)
			middle2Investment = tonumber(text)
		end
		textinput4Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput4Investisseur:SetPos(250,440):SetWidth(80):SetText("15000000")
		textinput4Investisseur.OnEnter = function(object,text)
			maximalInvestment = tonumber(text)
		end

		numberbox1Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox1Investisseur:SetPos(270,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox1Investisseur.OnValueChanged = function(object,value)
			minimalRendement = value
		end

		numberbox2Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox2Investisseur:SetPos(270,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox2Investisseur.OnValueChanged = function(object,value)
			middleRendement = value
		end

		numberbox3Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox3Investisseur:SetPos(270,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox3Investisseur.OnValueChanged = function(object,value)
			maximalRendement = value
		end

	form2Investisseur = loveframes.Create("form",principaleFrame)
	form2Investisseur:SetPos(420,90):SetSize(310,400):SetName("Règlage de la maturité des investissements")

		text1Investisseur = loveframes.Create("text",principaleFrame)
		text1Investisseur:SetPos(430,150):SetText("Maturité mini. :\t\t\t\t\t\t\t\t\t\t     F\n\n\n\n\n\n\nMaturité moyenne :\t\t\t\t\t\t\t\t      F\n\n\n\n\n\n\nMaturité élevée :\t\t\t\t\t\t\t\t\t\t  F\n\n\n\n\n\n\nMaturité max. :\t\t\t\t\t\t\t\t\t\t\t F")
		text2Investisseur = loveframes.Create("text",principaleFrame)
		text2Investisseur:SetPos(450,195):SetText("- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :")

		textinput1Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput1Investisseur:SetPos(620, 145):SetWidth(80):SetText("100000")
		textinput1Investisseur.OnEnter = function(object,text)
			minimalTimeInvestment = tonumber(text)
		end
		textinput2Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput2Investisseur:SetPos(620, 240):SetWidth(80):SetText("800000")
		textinput2Investisseur.OnEnter = function(object,text)
			middle1TimeInvestment = tonumber(text)
		end
		textinput3Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput3Investisseur:SetPos(620,340):SetWidth(80):SetText("8000000")
		textinput3Investisseur.OnEnter = function(object,text)
			middle2TimeInvestment = tonumber(text)
		end
		textinput4Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput4Investisseur:SetPos(620,440):SetWidth(80):SetText("15000000")
		textinput4Investisseur.OnEnter = function(object,text)
			maximalTimeInvestment = tonumber(text)
		end

		numberbox1Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox1Investisseur:SetPos(640,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox1Investisseur.OnValueChanged = function(object,value)
			minimal2Rendement = value
		end

		numberbox2Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox2Investisseur:SetPos(640,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox2Investisseur.OnValueChanged = function(object,value)
			middle2Rendement = value
		end

		numberbox3Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox3Investisseur:SetPos(640,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox3Investisseur.OnValueChanged = function(object,value)
			maximal2Rendement = value
		end

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
		hook.Remove("OverLayDraw", "Slidertest")
		love.mouse.setCursor( c_arrow )
	end
	local cancelPresetButton = loveframes.Create("button", principaleFrame)
	cancelPresetButton:SetText("Annuler"):SetPos(395,560)
	cancelPresetButton.OnClick = function()
		principaleFrame:Remove()
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
		hook.Remove("OverLayDraw", "Slidertest")
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
	local currentDay = T_DAY
	local currentMonth = T_MONTH
	local currentYear = T_YEAR
	local x,y,z
	
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
			attentePublicite = 93
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
		x,y,z = calculateDate(currentDay,currentMonth,currentYear,attentePublicite)
		createEvent(string.format("%i%i%i",x,y,z), "Popularity = Popularity + popularitePublicite")
	end	
---------------------------------------------------------------------------------------------------------
	employeeManagementForm = loveframes.Create("form", budgetFrame)
	employeeManagementForm:SetPos(20,280):SetSize(300,170):SetName("Gestion du personnel")
	employeeManagementText = loveframes.Create("text", budgetFrame)
	employeeManagementText:SetPos(30,350):SetText("Nombre d'employés : "..nbEmployees)
	employeeManagementText2 = loveframes.Create("text", budgetFrame)
	employeeManagementText2:SetPos(30,350)
	employeeManagementNumberbox = loveframes.Create("numberbox",budgetFrame)
	employeeManagementNumberbox:SetPos(170,420):SetMinMax(0,nbEmployees):SetIncreaseAmount(1):SetWidth(60):SetValue(0):SetHeight(25)
	employeeManagementNumberbox.OnValueChanged = function(object,value)
		if employeeManagementMultichoice:GetChoice() == "Recruter" then
			employeeManagementText2:SetText("\nCoût sup. : "..(employeeManagementNumberbox:GetValue() * Salary).."F/mois\nPopularité : +"..employeeManagementNumberbox:GetValue())
		elseif employeeManagementMultichoice:GetChoice() == "Licencier" then
			employeeManagementText2:SetText("\nEconomie : "..(employeeManagementNumberbox:GetValue() * Salary).."F/mois\nPopularité : -"..employeeManagementNumberbox:GetValue())
		end
	end
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
		employeeManagementText:SetText("Nombre d'employés : "..nbEmployees)
	end

	employeeManagementMultichoice = loveframes.Create("multichoice", budgetFrame)
	employeeManagementMultichoice:SetPos(25,295):AddChoice("Recruter"):AddChoice("Licencier")
	employeeManagementMultichoice.OnChoiceSelected = function(object,choice)
		employeeManagementButton:SetText(choice)
		if choice == "Recruter" then employeeManagementText2:SetText("\nCoût sup. : \nPopularité :")
		elseif choice == "Licencier" then employeeManagementText2:SetText("\nEconomie : \nPopularité :")
		end
	end
-------------------------------------------------------------------------------------------------------------
	salaryForm = loveframes.Create("form", budgetFrame)
	salaryForm:SetPos(430, 280):SetSize(300,170):SetName("Gestion des salaires")
	salaryMultichoice = loveframes.Create("multichoice", budgetFrame)
	salaryMultichoice:SetPos(435,295):AddChoice("Augmenter les salaires"):AddChoice("Baisser les salaires")
	salaryMultichoice.OnChoiceSelected = function(object,choice)
		if choice == "Augmenter les salaires" then salaryButton:SetText("Augmenter")
		elseif choice == "Baisser les salaires" then salaryButton:SetText("Baisser") end end
	salaryText1 = loveframes.Create("text", budgetFrame)
	salaryText1:SetPos(440,350):SetText("Nombre d'employés : ".. nbEmployees.."\nSalaire actuel : "..Salary.."F")
	salaryText2 = loveframes.Create("text", budgetFrame)
	salaryText2:SetPos(440,350):SetText("\n\nCoût sup. : ")
	salaryNumberbox = loveframes.Create("numberbox", budgetFrame)
	salaryNumberbox:SetPos(500,420):SetSize(120,25):SetMinMax(0,Money/nbEmployees):SetIncreaseAmount(200):SetValue(200):SetDecreaseAmount(200)
	salaryNumberbox.OnValueChanged = function(object,value)
		if salaryMultichoice:GetChoice() == "Augmenter les salaires" then salaryText2:SetText("\n\nCoût sup. mensuel : "..value * nbEmployees.."F")
		elseif salaryMultichoice:GetChoice() == "Baisser les salaires" then salaryText2:SetText("\n\nEconomie mensuelle : "..value * nbEmployees.."F") end end
	salaryButton = loveframes.Create("button", budgetFrame)
	salaryButton:SetPos(620,420)
	salaryButton.OnClick = function(object)
		if salaryMultichoice:GetChoice() == "Augmenter les salaires" then
			Salary = Salary + salaryNumberbox:GetValue()
			Popularity = Popularity + (salaryNumberbox:GetValue()/200 * 2)
		elseif salaryMultichoice:GetChoice() == "Baisser les salaires" then
			Salary = Salary - salaryNumberbox:GetValue()
			Popularity = Popularity - (salaryNumberbox:GetValue()/200 * 2)
		end
		salaryText1:SetText("Nombre d'employés : ".. nbEmployees.."\nSalaire actuel : "..Salary)
	end


	saveBudgetButton = loveframes.Create("button", budgetFrame)
	saveBudgetButton:SetText("Enregistrer"):SetPos(325,560)
	saveBudgetButton.OnClick = function(object)
		budgetFrame:Remove()
		love.mouse.setCursor( c_cursor )
		IsOnDesktop = true
		unpausetime()
	end
	cancelBudgetButton = loveframes.Create("button", budgetFrame)
	cancelBudgetButton:SetText("Annuler"):SetPos(475, 560)
	cancelBudgetButton.OnClick = function(object)
		Pub = PubSave
		budgetFrame:Remove()
		love.mouse.setCursor( c_cursor )
		IsOnDesktop = true
		unpausetime()
	end
end
