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
	if str == nil then return bank.corpo_get(corp_name) end
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

function getvalue_fromnum(num)
	if num >600 then return "Month" else return "Day" end
end

function bank.corpo_get_value_date(corp_name)
	local corp_name = bank.corpo_get(corp_name).Symbol
	if DataCache_values[corp_name] then  print("loading ... " .. corp_name) return DataCache_values[corp_name] end
	local str = string.format("http://dev.markitondemand.com/Api/v2/InteractiveChart/json?parameters={\"Normalized\":false,\"NumberOfDays\":%i,\"DataPeriod\":\"%s\",\"Elements\":[{\"Symbol\":\"%s\",\"Type\":\"price\",\"Params\":[\"c\"]}]}", 1095, "Day", corp_name)
	str = http.request(str)
	local tbl = json.decode(str)
	if tbl.message then
		print(tbl.message)
		return {}
	end
	DataCache_values[corp_name] = json.decode(str)
	return tbl
end