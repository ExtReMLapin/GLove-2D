local json = require("modules/json")

function init_restore()
	if not love.filesystem.read("data.txt") then -- 1st use ?
		bought_objects = {}
		bought_actions = {}
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
	tbl.cash = account_virtual_money
	tbl.bought_objects = bought_objects
	str = json.encode(tbl)
	love.filesystem.write("data.txt", str)
end


function do_restore()
	local str = love.filesystem.read("data.txt")
	local tbl = json.decode(str)
	bought_objects = tbl.bought_objects
	account_virtual_money = tbl.cash
end


