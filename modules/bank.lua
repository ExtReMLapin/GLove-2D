local http = require("socket.http");
local json = require("modules/json")
local string = require("string")
DataCache = {}
DataCache_infos = {}
DataCache_values = {}
bank = {}


-- decode url http://meyerweb.com/eric/tools/dencoder/
-- json viewer http://jsonviewer.stack.hu/
-- yahoo example https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22AMD%22%29&format=json&diagnostics=false&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys


function bank.corpo_get_infos(corp_name, refresh) -- return all the infos (instant infos, no timeline)
	if DataCache_infos[corp_name] and not refresh then return DataCache_infos[corp_name] end
	local str = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22" .. corp_name .."%22%29&format=json&diagnostics=false&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
	str = http.request(str)
	local tbl = json.decode(str)
	tbl = tbl.query.results.quote
	tbl.Bid = tbl.Bid or tbl.Ask
	DataCache_infos[corp_name] = tbl
	PrintTable(tbl)
	return tbl
end

function getvalue_fromnum(num)
	if num >600 then return "Month" else return "Day" end
end

function bank.corpo_get_value_date(corp_name)
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