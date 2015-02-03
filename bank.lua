local http = require("socket.http");
local json = require("json")
local string = require("string")
local _G = base
module("bank")


local function clear_render(str, mod) -- remove the string borders to make it readable by the json parser
	mod = mod or 0
	str = string.Right(str, string.len(str) - (7 + mod))
	str = string.Left(str, string.len(str) - (2 + mod))
	return str
end

function corpo_get(corp_name) -- return table : Exchange ; Name ; Symbol   -> you can enter in arg a aproximative name
	local str = string.format("http://dev.markitondemand.com/Api/v2/Lookup/jsonp?input=%s&callback=start", corp_name)
	str = http.request(str)
	if str == "start([])" then return {} end
	str = clear_render(str)
	return json.decode(str)
end


function corpo_get_infos(corp_name) -- return all the infos (instant infos, no timeline)
	corp_name = corpo_get(corp_name).Symbol
	local str = string.format("http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=%s&callback=start", corp_name)
	str = http.request(str)
	str = clear_render(str , -1 )
	local tbl = json.decode(str)
	if tbl.message then
		base.print(tbl.message)
		return {}
	end
	return tbl
end