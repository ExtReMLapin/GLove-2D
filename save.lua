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
		tbl.Money = Money
		tbl.Clients = CLients
		tbl.Pub = Pub
		tbl.PassedEvents = PassedEvents
		tbl.DynaEvent = DynaEvent
		tbl.nbEmployees = nbEmployees
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
	PassedEvents = {}
	DynaEvent = {}
	nbEmployees = 6
	Money = 16000000
	Pub = 0
	Clients = 0
	T_DAY = 1
	T_SEM = 1
	T_MONTH = 4
	T_YEAR = 1852
	Investisements = {Pub = 0}
end)
