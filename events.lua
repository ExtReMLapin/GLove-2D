require("modules/hook")

Event = {}
Event[1] = {}
Event[1].date = string.format("%i%i", 5, 1852)
Event[1].func = function () CreatePopUp("bite lol","L'épidémie de choléra débutée en Inde atteint maintenant la Russie et bientôt \nl'Europe, personne ne sait où elle s'arrêtera!") end
Event[2] = {}
Event[2].date = string.format("%i%i", 6, 1855)
Event[2].func = function() CreatePopUp("bite lol","L'épidémie de choléra débutée en Inde atteint maintenant la Russie et bientôt \nl'Europe, personne ne sait où elle s'arrêtera!") end
Event[3] = {}
Event[3].date = string.format("%i%i", 2, 1857)
Event[3].func = function() CreatePopUp("L'épidémie de choléra débutée en Inde atteint maintenant la Russie et bientôt \nl'Europe, personne ne sait où elle s'arrêtera!") end
Event[4] = {}
Event[4].date = string.format("%i%i", 11, 1859)
Event[4].func = function() CreatePopUp("Situé en Egypte, le Canal de Suez permettra de rallier la Mer Méditerranée\n à la Mer Rouge. Début des travaux.") end
Event[5] = {}
Event[5].date = string.format("%i%i", 1, 1860)
Event[5].func = function() CreatePopUp("C'est l'Age d'Or de l'agriculture Française !") end
Event[6] = {}
Event[6].date = string.format("%i%i", 6, 1860)
Event[6].func = function() CreatePopUp("Les forces confédérées attaquent les EU de Lincoln. \nDébut de la guerre de Sécession.") end



function createEvent(date, func)
	if not type(func) == "string" then error("Func in createEvent() must be a string, retard") end
	local tbl = {}
	tbl.date = date -- string.format("%i%i", 5, 1852)
	tbl.func = func
	table.insert(DynaEvent, tbl)
end




hook.Add("DateChange", "EventDateChange", function()
	for k, v in pairs(Event) do
		if not PassedEvents[k] then
			if v.date == string.format("%i%i", T_MONTH, T_YEAR)	then
				v.func()
				PassedEvents[k] = true;
			end
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
	if T_SEM == 1 and T_DAY == 1 and T_MONTH == 1 then -- début de l'année
		mainRate = math.random(1750,2250)/1000
	end
end)
