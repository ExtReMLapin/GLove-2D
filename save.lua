local FOLDER = "saves/"
local json = require("modules/json")

function init_restore()
	if not love.filesystem.read("data.txt") then -- 1st use ?
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
	tbl.cash = account_virtual_money or 2500
	tbl.bought_objects = bought_objects or {}
	str = json.encode(tbl)
	love.filesystem.write("data.txt", str)
end


function do_restore()
	local str = love.filesystem.read("data.txt")
	local tbl = json.decode(str)
	bought_objects = tbl.bought_objects or {}
	account_virtual_money = tbl.cash or 2500
end


