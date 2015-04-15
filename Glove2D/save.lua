local json = require("modules/json")
require("modules/hook")
data = {}
tblsave = ""

tbltuto = {}
tbltuto[1] = "Bienvenu dans votre banque ! \nAvant toute chose, faisons un tour des fonctionnalités à votre disposition pour gérer votre banque !"
tbltuto[2] = "Passez votre souris sur la flèche à droite de l'écran et regardons ensemble les informations à votre \ndisposition."
tbltuto[3] = "Des données importantes sur votre banques y sont affichées, comme les revenus, les dépenses ou encore \nle nombre d'employés par exemple."
tbltuto[4] = "J'attire votre attention sur ce que l'on appelle le ''Taux Directeur'' ! \nIl représente le taux auquel la Banque de France vous prête l'argent, cela signifie donc qu'il ne faudra pas \nprêter l'argent à un taux plus bas que celui-ci !"
tbltuto[5] = "Ensuite, l'indicateur de Popularité représente votre image auprès de la population, plus celui-ci est proche \nde 100, plus votre banque est populaire et réputée !"
tbltuto[6] = "Passons maintenant au second menu se trouvant en bas à gauche de votre écran, encore une fois, il vous \nsuffit de passer la souris sur la flèche pour le découvrir !"


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
	minimalCrediteurAskBehoof = 0
	middleCrediteurAskBehoof = 0
	maximalCrediteurAskBehoof = 0
	minimalCrediteurTimeBehoof = 0
	middleCrediteurTimeBehoof = 0
	maximalCrediteurTimeBehoof = 0
	minimalCrediteurIncomesBehoof = 0
	middleCrediteurIncomesBehoof = 0
	maximalCrediteurIncomesBehoof = 0
	lowCrediteurAsk = 0
	middleCrediteurAsk = 0
	lowCrediteurTime = 0
	middleCrediteurTime = 0
	lowCrediteurIncomes = 0
	middleCrediteurIncomes = 0
end)
