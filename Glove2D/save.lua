local json = require("modules/json")
require("modules/hook")
data = {}
tblsave = ""

tbltuto = {}
tbltuto[1] = "Bienvenu dans votre banque ! \nAvant toute chose, faisons un tour des fonctionnalités à votre disposition pour gérer votre banque !"
tbltuto[2] = "Passez votre souris sur la flèche à droite de l'écran et regardons ensemble les informations à votre \ndisposition."
tbltuto[3] = "Des données importantes sur votre banques y sont affichées, comme les revenus, les dépenses ou encore \nle nombre d'employés par exemple."
tbltuto[4] = "Ensuite, l'indicateur de Popularité représente votre image auprès de la population, plus celui-ci est proche \nde 100, plus votre banque est populaire et réputée !"
tbltuto[5] = "Passons maintenant au second menu se trouvant en bas à gauche de votre écran, encore une fois, il vous \nsuffit de passer la souris sur la flèche pour le découvrir !"
tbltuto[6] = "Comme vous pouvez le voir, ce menu est composé de plusieurs onglets : ''Investisseurs'', ''Créditeurs'' etc.."
tbltuto[7] = "Concentrons-nous d'abord sur l'onglet ''Investisseurs'' ! Celui-ci va vous permettre d'établir la rémunération\ndes Investisseurs"
tbltuto[8] = "Les jauges du menus vont vous permettre de gérer des paliers de rémunération, vous pouvez définir ces \npaliers en bougeant les curseurs sur la jauge"
tbltuto[9] = "A chaque palier est ensuite attrribué un taux de rémunération en %, que vous pouvez ajuster en cliquant \ndessus"
tbltuto[10] = "Ensuite, le taux d'un Investisseur est la somme des taux du montant et de la durée de son investissement"
tbltuto[11] = "Exemple : un investissement de 3 Millions de Francs sur un durée de 70 mois se verra appliquer un taux \nde 3.3% + 1% = 4.3%"


function init_restore()
	if not love.filesystem.read("data.txt") then -- 1st use ?
			hook.Call("FirstLaunch")
		bought_objects = {}
		account_virtual_money = 2500
		do_save_data()
		do_restore()
	else
		do_restore()
	end
end

function do_save_data()
	local tbl = {}
	local str;
		tbl.HAD_RATED = HAD_RATED
		tbl.T_DAY = T_DAY
		tbl.T_SEM = T_SEM
		tbl.T_MONTH = T_MONTH
		tbl.T_YEAR = T_YEAR
		tbl.annualPayment = annualPayment
		tbl.monthlyEarning = monthlyEarning
		tbl.Passed3mLimit = Passed3mLimit
		tbl.Money = Money
		tbl.Pub = Pub
		tbl.PassedEvents = PassedEvents
		tbl.DynaEvent = DynaEvent
		tbl.nbEmployees = nbEmployees
		tbl.nbInvestisseurs = nbInvestisseurs
		tbl.Salary = Salary
		tbl.mainRate = mainRate
		tbl.nbClients = nbClients
		tbl.PastMonthEvent = PastMonthEvent
		tbl.minimalInvestment = minimalInvestment
		tbl.middle1Investment = middle1Investment
		tbl.middle2Investment = middle2Investment
		tbl.maximalInvestment = maximalInvestment
		tbl.minimalTimeInvestment = minimalTimeInvestment
		tbl.middle1TimeInvestment = middle1TimeInvestment
		tbl.middle2TimeInvestment = middle2TimeInvestment
		tbl.maximalTimeInvestment = maximalTimeInvestment
		tbl.minimalRendement = minimalRendement
		tbl.middleRendement = middleRendement
		tbl.maximalRendement = maximalRendement
		tbl.minimal2Rendement = minimal2Rendement
		tbl.middle2Rendement = middle2Rendement
		tbl.maximal2Rendement = maximal2Rendement
		tbl.minimalCrediteurAskBehoof = minimalCrediteurAskBehoof
		tbl.middleCrediteurAskBehoof = middleCrediteurAskBehoof
		tbl.maximalCrediteurAskBehoof = maximalCrediteurAskBehoof
		tbl.minimalCrediteurTimeBehoof = minimalCrediteurTimeBehoof
		tbl.middleCrediteurTimeBehoof = middleCrediteurTimeBehoof
		tbl.maximalCrediteurTimeBehoof = maximalCrediteurTimeBehoof
		tbl.minimalCrediteurIncomesBehoof = minimalCrediteurIncomesBehoof
		tbl.middleCrediteurIncomesBehoof = middleCrediteurIncomesBehoof
		tbl.maximalCrediteurIncomesBehoof = maximalCrediteurIncomesBehoof
		tbl.lowCrediteurAsk = lowCrediteurAsk
		tbl.middleCrediteurAsk = middleCrediteurAsk
		tbl.lowCrediteurTime = lowCrediteurTime
		tbl.middleCrediteurTime = middleCrediteurTime
		tbl.lowCrediteurIncomes = lowCrediteurIncomes
		tbl.middleCrediteurIncomes = middleCrediteurIncomes
		tbl.engouement = engouement
		tbl.reputation = reputation
		tbl.connaissanceBanque = connaissanceBanque
		tbl.employeeEfficiency = employeeEfficiency
		tbl.crisisIndicator = crisisIndicator
		tbl.crisisIndicator2 = crisisIndicator2
		tbl.tauxConcurrent1Crediteur = tauxConcurrent1Crediteur
		tbl.tauxConcurrent2Crediteur = tauxConcurrent2Crediteur
		tbl.tauxConcurrent3Crediteur = tauxConcurrent3Crediteur
		tbl.tauxConcurrent1Investisseur = tauxConcurrent1Investisseur
		tbl.tauxConcurrent2Investisseur = tauxConcurrent2Investisseur
		tbl.tauxConcurrent3Investisseur = tauxConcurrent3Investisseur
		str = table.ToString(tbl, "tblsave", true)
		love.filesystem.write("data.txt", str)
end


function do_restore()
	local func = loadstring(love.filesystem.read("data.txt"))
	func()
	table.Merge(_G, tblsave)
	func = nil
	tblsave = nil
	hook.Call("SaveRestored")
end

hook.Add("FirstLaunch", "timerfirstlaunch", function()
	Passed3mLimit = false
	PastMonthEvent = {}
	PastMonthEvent.Months = {}
	PastMonthEvent.MonthsV = {}
	PassedEvents = {}
	DynaEvent = {}
	--tabInvestisseurs = {}
	nbClients = 3
	nbEmployees = 6
	annualPayment = 0
	nbInvestisseurs = 0
	Popularity = 0
	Salary = 6500
	Money = 6000000
	Pub = 0
	T_DAY = 1
	T_SEM = 1
	T_MONTH = 4
	T_YEAR = 1852
	minimalInvestment = 100000
	middle1Investment = 800000
	middle2Investment = 8000000
	maximalInvestment = 15000000
	minimalTimeInvestment = 12
	middle1TimeInvestment = 36
	middle2TimeInvestment = 72
	maximalTimeInvestment = 120
	minimalRendement = 2.1
	middleRendement = 3.3
	maximalRendement = 4.5
	minimal2Rendement = 2.1
	middle2Rendement = 3.3
	maximal2Rendement = 4.5
	mainRate = math.random(1750,2250)/1000
	engouement = 0
	reputation = 0
	connaissanceBanque = 550000
	employeeEfficiency = 1
	Investisements = {Pub = 0}
	monthlyEarning = 0
	CreateTutorialBox(tbltuto)
	HAD_RATED = false
	minimalCrediteurAskBehoof = 1
	middleCrediteurAskBehoof = 2
	maximalCrediteurAskBehoof = 3
	minimalCrediteurTimeBehoof = 1
	middleCrediteurTimeBehoof = 2
	maximalCrediteurTimeBehoof = 3
	minimalCrediteurIncomesBehoof = 1
	middleCrediteurIncomesBehoof = 2
	maximalCrediteurIncomesBehoof = 3
	lowCrediteurAsk = 0
	middleCrediteurAsk = 0
	lowCrediteurTime = 0
	middleCrediteurTime = 0
	lowCrediteurIncomes = 0
	middleCrediteurIncomes = 0
	crisisIndicator = 0
	crisisIndicator2 = 0
	tauxConcurrent1Crediteur = 0
	tauxConcurrent2Crediteur = 0
	tauxConcurrent3Crediteur = 0
	tauxConcurrent1Investisseur = 0
	tauxConcurrent2Investisseur = 0
	tauxConcurrent3Investisseur = 0
end)
