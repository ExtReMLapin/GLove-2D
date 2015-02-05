local http = require("socket.http");
local json = require("modules/json")
local string = require("string")
DataCache = {}
DataCache_infos = {}
DataCache_values = {}
bank = {}


local function clear_render(str, mod) -- remove the string borders to make it readable by the json parser
	mod = mod or 0
	str = string.Right(str, string.len(str) - (7 + mod))
	str = string.Left(str, string.len(str) - (2 + mod))
	return str
end

function bank.corpo_get(corp_name) -- return table : Exchange ; Name ; Symbol   -> you can enter in arg a aproximative name
	if DataCache[corp_name] then return DataCache[corp_name] end
	local str = string.format("http://dev.markitondemand.com/Api/v2/Lookup/jsonp?input=%s&callback=start", corp_name)
	str = http.request(str)
	if str == "start([])" then return {} end
	str = clear_render(str)
	DataCache[corp_name] = json.decode(str)
	return json.decode(str)
end


function bank.corpo_get_infos(corp_name) -- return all the infos (instant infos, no timeline)
	local corp_name = bank.corpo_get(corp_name).Symbol
	if DataCache_infos[corp_name] then return DataCache_infos[corp_name] end
	local str = string.format("http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=%s&callback=start", corp_name)
	str = http.request(str)
	str = clear_render(str , -1 )
	local tbl = json.decode(str)
	if tbl.message then
		print(tbl.message)
		return {}
	end
	DataCache_infos[corp_name] = json.decode(str)
	return tbl
end


function bank.corpo_get_value_date(corp_name, timea, timeb)
	local corp_name = bank.corpo_get(corp_name).Symbol
	if DataCache_values[corp_name] then return DataCache_values[corp_name] end
	local str = "http://dev.markitondemand.com/Api/v2/InteractiveChart/json?parameters=%7B%22Normalized%22%3Afalse%2C%22NumberOfDays%22%3A365%2C%22DataPeriod%22%3A%22Day%22%2C%22Elements%22%3A%5B%7B%22Symbol%22%3A%22".. corp_name .. "%22%2C%22Type%22%3A%22price%22%2C%22Params%22%3A%5B%22c%22%5D%7D%5D%7D"
	str = http.request(str)
	local tbl = json.decode(str)
	if tbl.message then
		print(tbl.message)
		return {}
	end
	DataCache_values[corp_name] = json.decode(str)
	return tbl
end