
local file_ , found = file.Find("garrysmod/lua/bin/gmsv_*_linux.dll", "BASE_PATH")
for k, v in pairs(file_) do
	v = string.gsub(v , "_linux.dll", "") 
	v = string.gsub(v , "gmsv_", "")
	MsgC( Color(50,50,255), "Loading ".. v .." ... ")
	require(v)
	MsgC(Color(50,255,50), "Done !\n")
end

function io.fileExists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function io.readFile(fileName)
	local file = io.open(fileName, "r");

	if file then
		local allContent = file:read("*all");
		print(allContent);
		file:close();
	end
end

function io.writeFile(filename, contents, exists)

	local f = io.open( filename, "w", "DATA" )	
	if exists then	local f = io.open( filename, "wb", "DATA" ) end
	
	if ( !f ) then return end

	f:write( contents )
	f:close()

end

function http.Print(adr)
	http.Fetch(adr, function( body, len, headers, code )
		print(body)           
		end)
end


function http.GetBody(adr, callback)
	http.Fetch(adr, function( body, len, headers, code )
		callback(body)         
		end)
end

Brand = {}
Brand[1] = {}
Brand[2] = {}
Brand[3] = {}
Brand[4] = {}
Brand[5] = {}
Brand[6] = {}
Brand[7] = {}
Brand[8] = {}
Brand[1].Name = "AMD"
Brand[1].rn = "AMD"
Brand[2].Name = "NVIDIA"
Brand[2].rn = "NVDA"
Brand[3].Name = "INTEL"
Brand[3].rn = "INTC"
Brand[4].Name = "Netflix"
Brand[4].rn = "NFLX"
Brand[5].Name = "Apple"
Brand[5].rn = "AAPL"
Brand[6].Name = "Facebook"
Brand[6].rn = "FB"
Brand[6].rnfix = "FB"
Brand[7].Name = "Microsoft"
Brand[7].rn = "MSFT"
Brand[8].Name = "Google"
Brand[8].rn = "GOOGL"
local LOOPED = 0;

for k, v in pairs(Brand) do
	if not v.rnfix then
		v.rnfix = v.rn
	end
	if not file.Exists("garrysmod/data/safetrade/".. v.Name ..".txt",  "BASE_PATH") then
		file.Write("safetrade/" .. v.Name .. ".txt", "{}")
	end
end

local function do_update_trends()
LOOPED = LOOPED + 1
for k, v in pairs(Brand) do
	hastoskip = false;
		--local adr = "http://chartapi.finance.yahoo.com/instrument/1.0/".. v.rn .."/chartdata;type=quote;range=3y/json"
		local adr = string.format("http://dev.markitondemand.com/Api/v2/InteractiveChart/json?parameters={\"Normalized\":false,\"NumberOfDays\":%i,\"DataPeriod\":\"%s\",\"Elements\":[{\"Symbol\":\"%s\",\"Type\":\"price\",\"Params\":[\"c\"]}]}", 1095, "Day", v.rn)		
		http.Fetch(adr, function( body, len, headers, code )
			MsgC( Color(50,50,255), "Writing to /var/www/html/".. v.rn .." ... ")
			if len < 15000 then  MsgC(Color(50,255,50), "ERROR FAIL SIZE  -> " .. math.Round(len/1000) .. "k\n")  return end;
			if io.fileExists("/var/www/html/" .. v.Name) then
				io.writeFile("/var/www/html/" .. v.Name, body, false)	
			else
				io.writeFile("/var/www/html/" .. v.Name, body, true)
			end
			MsgC(Color(50,255,50), "Done ! (".. k .. "/".. #Brand ..") ([#" .. LOOPED .."] -> " .. math.Round(len/1000) .. "k\n")
				end) 
	end
	MsgC(Color(255,50,50), "Done \n")

end


local function do_update_yahoo()
	for k, v in pairs(Brand) do
		local adr = "http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=" .. v.rn .."&callback=start"
		http.Fetch(adr, function( body, len, headers, code )

			body = string.Right(body, string.len(body) - 6 )
			body = string.Left(body, string.len(body) - 1 )
			local tbl = util.JSONToTable(body)
			local price = tbl.LastPrice
			local tbl = util.JSONToTable(file.Read("garrysmod/data/safetrade/" .. v.Name .. ".txt", "BASE_PATH"))
			local tbl2 = {}
			tbl2.time = os.time()
			tbl2.price = price
			table.insert(tbl,tbl2)
			file.Write("safetrade/" .. v.Name .. ".txt",util.TableToJSON(tbl))
			if io.fileExists("/var/www/html/" .. v.Name .. "_good") then
				io.writeFile("/var/www/html/" .. v.Name .. "_good", util.TableToJSON(tbl), false)
			else
				io.writeFile("/var/www/html/" .. v.Name .. "_good", util.TableToJSON(tbl), true)
			end
		end)
	end
end

local function get_current_values(v)
	local adr = "http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=" .. v.rn .."&callback=start"
	http.Fetch(adr, function( body, len, headers, code )
		body = string.Right(body, string.len(body) - 6 )
		body = string.Left(body, string.len(body) - 1 )
		local tbl = util.JSONToTable(body)
		local price = tbl.LastPrice
		if io.fileExists("/var/www/html/" .. v.Name .. "_goodinstant") then
			io.writeFile("/var/www/html/" .. v.Name .. "_goodinstant", tostring(price), false)
		else
			io.writeFile("/var/www/html/" .. v.Name .. "_goodinstant", tostring(price), true)
		end
	end)
end

local function updates_all_rt()
	local i = #Brand
	i = 30/i -- this is the timer, we calc the delay to detect how much time between each call
	for k, v in pairs(Brand) do
		timer.Simple(i+k-1, function() get_current_values(v) MsgC(Color(50,100,100), Format("Processing current value [%i]\n", k)) end)
		i = k+i
	end
end


local function updates_all_infos()
	local i = #Brand
	i = 30/i -- this is the timer, we calc the delay to detect how much time between each call
	for k, v in pairs(Brand) do
		timer.Simple(i+k-1, function() get_current_infos(v) MsgC(Color(120,120,120), Format("Processing current infos [%i]\n", k)) end)
		i = k+i
	end
end


timer.Simple(0, function()
	game.ConsoleCommand("bot;")
	timer.Create("ST_LoopWriteHTTP",3600*2 , 0, do_update_trends)
	timer.Create("ST_LoopWriteHTTPYahoo",3600 , 0, do_update_yahoo)
	timer.Create("ST_LoopWriteHTTPRealTime",50 , 0,	updates_all_rt)
	updates_all_rt()
	do_update_trends()
	do_update_yahoo()
end)
