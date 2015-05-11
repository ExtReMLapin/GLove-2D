local json = require("modules/json")
require("modules/hook")
data = {}
tblsave = ""

tbltuto = {}
tbltuto[1] = "Bonjour et bienvenu sur BossBank !\nAvant de vous lancer dans la gestion de votre banque, faisons un point rapide sur le \nfonctionnement des banques modernes !"
tbltuto[2] = "La majorité des revenus d'une banque vient de la rentabilisation de l'argent des \ninvestisseurs, et voici comment tout cela se passe :\nLes investisseurs (professionnels ou particuliers) déposent leur argent contre une rémunération \nannuelle (les dividendes)\nCet argent va ensuite être prêtée aux créditeurs, contre un intérêts qu'ils vous devront \nen plus du remboursement du crédit\n\nEt voilà ! Ce n'est pas plus compliqué que cela ! Attention cependant,\n la banque se doit de s'assurer qu'elle puisse rendre les fonds à l'investisseur à tout moment !"
tbltuto[3] = "Bien sûr ce ne sont pas les seuls revenus des banques, mais pour le reste, \ntu auras tout le temps de le découvrir en développant ta banque !\n\nIl ne te reste plus qu'à te lancer maintenant ! Un tutoriel complet sur \nl'interface du jeu t'expliquera comment bien utiliser les outils à ta disposition !"
tbltuto[4] = "Bienvenu dans votre banque ! \nAvant toute chose, faisons un tour des fonctionnalités à votre disposition pour gérer votre banque !"
tbltuto[5] = "Passez votre souris sur la flèche à droite de l'écran et regardons ensemble les informations à votre \ndisposition."
tbltuto[6] = "Des données importantes sur votre banques y sont affichées, comme les revenus, les dépenses ou encore \nle nombre d'employés par exemple."
tbltuto[7] = "Ensuite, l'indicateur de Popularité représente votre image auprès de la population, plus celui-ci est proche \nde 100, plus votre banque est populaire et réputée !"
tbltuto[8] = "Passons maintenant au second menu se trouvant en bas à gauche de votre écran, encore une fois, il vous \nsuffit de passer la souris sur la flèche pour le découvrir !"
tbltuto[9] = "Comme vous pouvez le voir, ce menu est composé de plusieurs onglets : ''Investisseurs'', ''Créditeurs'' etc.."
tbltuto[10] = "Concentrons-nous d'abord sur l'onglet ''Investisseurs'' ! Celui-ci va vous permettre d'établir la rémunération\ndes Investisseurs"
tbltuto[11] = "Les jauges du menus vont vous permettre de gérer des paliers de rémunération, vous pouvez définir ces \npaliers en bougeant les curseurs sur la jauge"
tbltuto[12] = "A chaque palier est ensuite attribué un taux de rémunération en %, que vous pouvez ajuster en cliquant \ndessus"
tbltuto[13] = "Ensuite, le taux d'un Investisseur est la somme des taux du montant et de la durée de son investissement"
tbltuto[14] = "Exemple : un investissement de 3 Millions de Francs sur un durée de 70 mois se verra appliquer un taux \nde 3.3% + 1% = 4.3%"
tbltuto[15] = "Nous ne nous attarderons pas sur l'interface Créditeurs, car elle fonctionne en tout point de la \nmême manière"
tbltuto[16] = "Passons donc directement à l'onglet ''Personnel'' ! Dans celui-ci, tu pourras contrôler et gérer \nton nombre d'employés et leur salaire"
tbltuto[17] = "Attention tout de même, un nombre réduit d'employés limite ton nombre de clients, et les employés \nsous-payés risquent de vous laisser tomber"
tbltuto[18] = "Il ne nous reste maintenant plus qu'un onglet à parcourir, celui dédié à la publicité !"
tbltuto[19] = "Cet onglet est primordial pour vous faire découvrir du public, mais aussi pour entretenir votre \npopularité auprès de la population"
tbltuto[20] = "Pour cela vous avez un choix de campagnes publicitaires à votre disposition, ayant chacune un coût \ndifférent. N'hésitez pas à renouveler la publicité pour plus de visibilité !"
tbltuto[21] = "Avant de lancer ta première campagne publicitaire, assure-toi d'avoir bien modifié les taux de \nrémunération et d'intérêts !"


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
	minimalRendement = 0
	middleRendement = 0
	maximalRendement = 0
	minimal2Rendement = 0
	middle2Rendement = 0
	maximal2Rendement = 0
	mainRate = math.random(1750,2250)/1000
	engouement = 0
	reputation = 0
	connaissanceBanque = 550000
	employeeEfficiency = 1
	Investisements = {Pub = 0}
	monthlyEarning = 0
	CreateBigTutorialBox()
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
	crisisIndicator = 0
	crisisIndicator2 = 0
	tauxConcurrent1Crediteur = 0
	tauxConcurrent2Crediteur = 0
	tauxConcurrent3Crediteur = 0
	tauxConcurrent1Investisseur = 0
	tauxConcurrent2Investisseur = 0
	tauxConcurrent3Investisseur = 0
end)
