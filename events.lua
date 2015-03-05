require("modules/hook")

Event = {}
Event[1] = {}
Event[1].date = string.format("%i%i", 5, 1852)
Event[1].func = function() print("yo mate, may the 4th be with you") end



function createEvent(date, func)
	if not type(func) == "string" then error("Func in createEvent() must be a string, retard") end
	local tbl = {}
	tbl.date = date -- string.format("%i%i", 5, 1852)
	tbl.func = func
	table.insert(DynaEvent, tbl)
end




hook.Add("DateChange", "EventDateChange", function()

	for k, v in pairs(Event) do
		if PassedEvents[k] then return end
		if v.date == string.format("%i%i", T_MONTH, T_YEAR)	then
			v.func()
			PassedEvents[k] = true;
		end
	end
	
end)

hook.Add("DateChange", "DynaEventDateChange", function()
	local func = nil
	for k, v in pairs(DynaEvent) do
		if v.date == string.format("%i%i%i",T_SEM , T_MONTH, T_YEAR)	then
			func = loadstring(v.func)
			func()
			table.remove(DynaEvent,k)
		end
	end
	
end)

hook.Add("DateChange", "Taxes", function()
	if T_SEM == 1 and T_DAY == 1 then
		addMoney(-12000, "Location locaux")
		addMoney(-6500 * nbEmployees, "Salaires")
		--addMoney(-6000, "Location mensuelle")
	end
end)

hook.Add("DateChange", "Taux Directeur", function()
	if T_SEM == 1 and T_DAY == 1 and T_MONTH = 1 then -- début de l'année
		mainRate = math.random(1750,2250)/1000
	end
end)



hook.Add("DateChange", "PuBClientCalc", function()

end)
