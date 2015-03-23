
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
		text1Investisseur:SetPos(60,150):SetText("Investissement minimum (F):\n\n\n\n\n\n\nInvestissement moyen (F):\n\n\n\n\n\n\nInvestissement élevé (F):\n\n\n\n\n\n\nInvestissement maximum (F):")
		text2Investisseur = loveframes.Create("text",principaleFrame)
		text2Investisseur:SetPos(80,195):SetText("- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :")

		textinput1Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput1Investisseur:SetPos(250, 145):SetWidth(80):SetText(tostring(minimalInvestment))

		textinput2Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput2Investisseur:SetPos(250, 240):SetWidth(80):SetText(tostring(middle1Investment))

		textinput3Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput3Investisseur:SetPos(250,340):SetWidth(80):SetText(tostring(middle2Investment))

		textinput4Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput4Investisseur:SetPos(250,440):SetWidth(80):SetText(tostring(maximalInvestment))


		numberbox1Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox1Investisseur:SetPos(270,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)


		numberbox2Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox2Investisseur:SetPos(270,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)


		numberbox3Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox3Investisseur:SetPos(270,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)


	form2Investisseur = loveframes.Create("form",principaleFrame)
	form2Investisseur:SetPos(420,90):SetSize(310,400):SetName("Règlage de la durée des investissements")

		text1Investisseur = loveframes.Create("text",principaleFrame)
		text1Investisseur:SetPos(430,150):SetText("Durée mini. (Mois):\n\n\n\n\n\n\nDurée moyenne (Mois):\n\n\n\n\n\n\nDurée élevée (Mois):\n\n\n\n\n\n\nDurée max. (Mois):")
		text2Investisseur = loveframes.Create("text",principaleFrame)
		text2Investisseur:SetPos(450,195):SetText("- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :")

		textinput5Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput5Investisseur:SetPos(620, 145):SetWidth(80):SetText(tostring(minimalTimeInvestment))

		textinput6Investisseur = loveframes.Create("textinput",principaleFrame)
		textinput6Investisseur:SetPos(620, 240):SetWidth(80):SetText(tostring(middle1TimeInvestment))

		textinput7Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput7Investisseur:SetPos(620,340):SetWidth(80):SetText(tostring(middle2TimeInvestment))

		textinput8Investisseur = loveframes.Create("textinput", principaleFrame)
		textinput8Investisseur:SetPos(620,440):SetWidth(80):SetText(tostring(maximalTimeInvestment))


		numberbox4Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox4Investisseur:SetPos(640,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)


		numberbox5Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox5Investisseur:SetPos(640,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)


		numberbox6Investisseur = loveframes.Create("numberbox", principaleFrame)
		numberbox6Investisseur:SetPos(640,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)

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
		minimalInvestment = tonumber(textinput1Investisseur:GetText())
		middle1Investment = tonumber(textinput2Investisseur:GetText())
		middle2Investment = tonumber(textinput3Investisseur:GetText())
		maximalInvestment = tonumber(textinput4Investisseur:GetText())
		minimalTimeInvestment = tonumber(textinput5Investisseur:GetText())
		middle1TimeInvestment = tonumber(textinput6Investisseur:GetText())
		middle2TimeInvestment = tonumber(textinput7Investisseur:GetText())
		maximalTimeInvestment = tonumber(textinput8Investisseur:GetText())
		minimalRendement = numberbox1Investisseur:GetValue()
		middleRendement = numberbox2Investisseur:GetValue()
		maximalRendement = numberbox3Investisseur:GetValue()
		minimal2Rendement = numberbox4Investisseur:GetValue()
		middle2Rendement = numberbox5Investisseur:GetValue()
		maxima2lRendement = numberbox6Investisseur:GetValue()
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
			attentePublicite = 84
			popularitePublicite = 3
		elseif choice == "Presse" then
			prixPublicite = 20000
			attentePublicite = 28
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
		addMoney(-prixPublicite,"Campagne pub.")
		x,y,z = calculateDate(T_DAY,T_MONTH,T_YEAR,attentePublicite)
		createEvent(string.format("%i/%i/%i",x,y,z), "Popularity = Popularity + ".. popularitePublicite)
	end	
---------------------------------------------------------------------------------------------------------
	employeeManagementForm = loveframes.Create("form", budgetFrame)
	employeeManagementForm:SetPos(20,280):SetSize(300,170):SetName("Gestion du personnel")
	employeeManagementText = loveframes.Create("text", budgetFrame)
	employeeManagementText:SetPos(30,350):SetText("Nombre d'employés : "..nbEmployees)
	employeeManagementText2 = loveframes.Create("text", budgetFrame)
	employeeManagementText2:SetPos(30,350)
	employeeManagementNumberbox = loveframes.Create("numberbox",budgetFrame)
	employeeManagementNumberbox:SetPos(170,420):SetMinMax(0,17 - nbEmployees):SetIncreaseAmount(1):SetWidth(60):SetValue(0):SetHeight(25)
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
		if employeeManagementNumberbox:GetValue() + nbEmployees > 17 then
			employeeManagementNumberbox:SetValue(0)
			employeeManagementNumberbox:SetMinMax(0,17 - nbEmployees)
		end
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

function crediteurMenu()
	IsOnDesktop = false
	local dureeInvestisseurMin = 14
	local dureeInvestisseurMax = 220
	local remunerationInvestisseur
	principaleFrame = loveframes.Create("frame")
	principaleFrame:SetName("Menu Investisseur"):SetSize(820, 600):Center():ShowCloseButton(false)
	principaleFrame.OnClose = function(object)
		secondaryFrame:Remove()
		IsOnDesktop = true
		unpausetime()
	end

	form1Crediteur = loveframes.Create("form",principaleFrame)
	form1Crediteur:SetPos(10,90):SetSize(290,400):SetName("Règlage des sommes empruntées")

		text1Crediteur = loveframes.Create("text",principaleFrame)
		text1Crediteur:SetPos(20,150):SetText("Investissement minimum (F):\n\n\n\n\n\n\nInvestissement moyen (F):\n\n\n\n\n\n\nInvestissement élevé (F):\n\n\n\n\n\n\nInvestissement maximum (F):")
		text2Crediteur = loveframes.Create("text",principaleFrame)
		text2Crediteur:SetPos(40,195):SetText("- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :\n\n\n\n\n\n\n- Rendement du palier(%) :")

		textinput1Crediteur = loveframes.Create("textinput",principaleFrame)
		textinput1Crediteur:SetPos(210, 145):SetWidth(80):SetText("100000")
		textinput1Crediteur.OnEnter = function(object,text)
			minimalCredit = tonumber(text)
		end
		textinput2Crediteur = loveframes.Create("textinput",principaleFrame)
		textinput2Crediteur:SetPos(210, 240):SetWidth(80):SetText("800000")
		textinput2Crediteur.OnEnter = function(object,text)
			middle1Credit = tonumber(text)
		end
		textinput3Crediteur = loveframes.Create("textinput", principaleFrame)
		textinput3Crediteur:SetPos(210,340):SetWidth(80):SetText("8000000")
		textinput3Crediteur.OnEnter = function(object,text)
			middle2Credit = tonumber(text)
		end
		textinput4Crediteur = loveframes.Create("textinput", principaleFrame)
		textinput4Crediteur:SetPos(210,440):SetWidth(80):SetText("15000000")
		textinput4Crediteur.OnEnter = function(object,text)
			maximalCredit = tonumber(text)
		end

		numberbox1Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox1Crediteur:SetPos(230,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox1Crediteur.OnValueChanged = function(object,value)
			minimalBehoof = value
		end

		numberbox2Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox2Crediteur:SetPos(230,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox2Crediteur.OnValueChanged = function(object,value)
			middleBehoof = value
		end

		numberbox3Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox3Crediteur:SetPos(230,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox3Crediteur.OnValueChanged = function(object,value)
			maximalBehoof = value
		end

	form2Crediteur = loveframes.Create("form",principaleFrame)
	form2Crediteur:SetPos(305,90):SetSize(250,400):SetName("Réglages de la durée d'emprunt")

		text1Crediteur = loveframes.Create("text",principaleFrame)
		text1Crediteur:SetPos(315,150):SetText("Durée mini. (Mois) :\n\n\n\n\n\n\nDurée moy. (Mois) :\n\n\n\n\n\n\nDurée élevée (Mois) :\n\n\n\n\n\n\nDurée max. (Mois) :")
		text2Crediteur = loveframes.Create("text",principaleFrame)
		text2Crediteur:SetPos(335,195):SetText("- Intérêts du palier(%) :\n\n\n\n\n\n\n- Intérêts du palier(%) :\n\n\n\n\n\n\n- Intérêts du palier(%) :")

		textinput5Crediteur = loveframes.Create("textinput",principaleFrame)
		textinput5Crediteur:SetPos(465, 145):SetWidth(80):SetText("6")
		textinput5Crediteur.OnEnter = function(object,text)
			minimalTimeCredit = tonumber(text)
		end
		textinput6Crediteur = loveframes.Create("textinput",principaleFrame)
		textinput6Crediteur:SetPos(465, 240):SetWidth(80):SetText("36")
		textinput6Crediteur.OnEnter = function(object,text)
			middle1TimeCredit = tonumber(text)
		end
		textinput7Crediteur = loveframes.Create("textinput", principaleFrame)
		textinput7Crediteur:SetPos(465,340):SetWidth(80):SetText("72")
		textinput7Crediteur.OnEnter = function(object,text)
			middle2TimeCredit = tonumber(text)
		end
		textinput8Crediteur = loveframes.Create("textinput", principaleFrame)
		textinput8Crediteur:SetPos(465,440):SetWidth(80):SetText("120")
		textinput8Crediteur.OnEnter = function(object,text)
			maximalTimeCredit = tonumber(text)
		end

		numberbox4Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox4Crediteur:SetPos(485,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox4Crediteur.OnValueChanged = function(object,value)
			minimal2Behoof = value
		end

		numberbox5Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox5Crediteur:SetPos(485,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox5Crediteur.OnValueChanged = function(object,value)
			middle2Behoof = value
		end

		numberbox6Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox6Crediteur:SetPos(485,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox6Crediteur.OnValueChanged = function(object,value)
			maximal2Behoof = value
		end

	form3Crediteur = loveframes.Create("form",principaleFrame)
	form3Crediteur:SetPos(560,90):SetSize(250,400):SetName("Réglage des revenus annuels brut")

		text1Crediteur = loveframes.Create("text",principaleFrame)
		text1Crediteur:SetPos(570,150):SetText("Revenus mini. (F) :\n\n\n\n\n\n\nRevenus moy. (F) :\n\n\n\n\n\n\nRevenus élevée (F) :\n\n\n\n\n\n\nRevenus max. (F) :")
		text2Crediteur = loveframes.Create("text",principaleFrame)
		text2Crediteur:SetPos(590,195):SetText("- Intérêts du palier(%) :\n\n\n\n\n\n\n- Intérêts du palier(%) :\n\n\n\n\n\n\n- Intérêts du palier(%) :")

		textinput9Crediteur = loveframes.Create("textinput",principaleFrame)
		textinput9Crediteur:SetPos(720, 145):SetWidth(80):SetText("100000")
		textinput9Crediteur.OnEnter = function(object,text)
			minimalEarnCredit = tonumber(text)
		end
		textinput10Crediteur = loveframes.Create("textinput",principaleFrame)
		textinput10Crediteur:SetPos(720, 240):SetWidth(80):SetText("800000")
		textinput10Crediteur.OnEnter = function(object,text)
			middle1EarnCredit = tonumber(text)
		end
		textinput11Crediteur = loveframes.Create("textinput", principaleFrame)
		textinput11Crediteur:SetPos(720,340):SetWidth(80):SetText("8000000")
		textinput11Crediteur.OnEnter = function(object,text)
			middle2EarnCredit = tonumber(text)
		end
		textinput12Crediteur = loveframes.Create("textinput", principaleFrame)
		textinput12Crediteur:SetPos(720,440):SetWidth(80):SetText("15000000")
		textinput12Crediteur.OnEnter = function(object,text)
			maximalEarnCredit = tonumber(text)
		end

		numberbox7Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox7Crediteur:SetPos(740,190):SetWidth(60):SetDecimals(1):SetValue(2.1):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox7Crediteur.OnValueChanged = function(object,value)
			minimal3Behoof = value
		end

		numberbox8Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox8Crediteur:SetPos(740,288):SetWidth(60):SetDecimals(1):SetValue(3.3):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox8Crediteur.OnValueChanged = function(object,value)
			middle3Behoof = value
		end

		numberbox9Crediteur = loveframes.Create("numberbox", principaleFrame)
		numberbox9Crediteur:SetPos(740,388):SetWidth(60):SetDecimals(1):SetValue(4.5):SetMinMax(0,100):SetIncreaseAmount(0.1):SetDecreaseAmount(0.1)
		numberbox9Crediteur.OnValueChanged = function(object,value)
			maximal3Behoof = value
		end

	local savePresetButton = loveframes.Create("button", principaleFrame)
	savePresetButton:SetText("Enregistrer"):SetPos(270,560)
	savePresetButton.OnClick = function()
		--enregistrer les presets
		principaleFrame:Remove()
		IsOnDesktop = true
		unpausetime()
		hook.Remove("OverLayDraw", "Slidertest")
		love.mouse.setCursor( c_arrow )
	end
	local cancelPresetButton = loveframes.Create("button", principaleFrame)
	cancelPresetButton:SetText("Annuler"):SetPos(395,560)
	cancelPresetButton.OnClick = function()
		principaleFrame:Remove()
		IsOnDesktop = true
		unpausetime()
		hook.Remove("OverLayDraw", "Slidertest")
		love.mouse.setCursor( c_arrow )
	end
end