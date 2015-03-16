local json = require("modules/json")
require("modules/hook")
data = {}

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
		tbl.T_DAY = T_DAY
		tbl.T_SEM = T_SEM
		tbl.T_MONTH = T_MONTH
		tbl.T_YEAR = T_YEAR
		tbl.Passed3mLimit = Passed3mLimit
		tbl.Money = Money
		tbl.Pub = Pub
		tbl.PassedEvents = PassedEvents
		tbl.DynaEvent = DynaEvent
		tbl.nbEmployees = nbEmployees
		tbl.nbInvestisseurs = nbInvestisseurs
		tbl.tabInvestisseurs = tabInvestisseurs
		tbl.Popularity = Popularity
		tbl.Salary = Salary
		tbl.mainRate = mainRate
		tbl.Popularity = Popularity
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
		tbl.maxima2lRendement = maxima2lRendement
		str = json.encode(tbl)
		love.filesystem.write("data.txt", str)
end


function do_restore()
	local str = love.filesystem.read("data.txt")
	local tbl = json.decode(str)
	table.Merge(_G, tbl)
	hook.Call("SaveRestored")
end

hook.Add("FirstLaunch", "timerfirstlaunch", function()
	Passed3mLimit = false
	PastMonthEvent = {}
	PastMonthEvent.Months = {}
	PastMonthEvent.MonthsV = {}
	PassedEvents = {}
	DynaEvent = {}
	tabInvestisseurs = {}
	nbClients = 3
	nbEmployees = 6
	nbInvestisseurs = 0
	Popularity = 0
	Salary = 4000
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
	Investisements = {Pub = 0}
end)
