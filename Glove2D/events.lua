require("modules/hook")

Event = {}
Event[1] = {}
Event[1].date = string.format("%i/%i", 6, 1855)
Event[1].func = function() CreatePopUp("Epidemie de choléra","L'épidémie de choléra débutée en Inde \natteint maintenant la Russie et bientôt \nl'Europe, personne ne sait où elle s'arrêtera !\n") crisisIndicator = 0.05 end
Event[2] = {}
Event[2].date = string.format("%i/%i", 11, 1859)
Event[2].func = function() CreatePopUp("Construction du Canal de Suez","Situé en Egypte, le Canal de Suez permettra \nde rallier la Mer Méditerranée à la Mer Rouge.\nDébut des travaux...\n") crisisIndicator = -0.175 end
Event[3] = {}
Event[3].date = string.format("%i/%i", 1, 1860)
Event[3].func = function() CreatePopUp("Age d'Or de l'agriculture","C'est l'Age d'Or de l'agriculture Française !\n") end
Event[4] = {}
Event[4].date = string.format("%i/%i", 6, 1860)
Event[4].func = function() CreatePopUp("Guerre de Sécession","Les forces confédérées attaquent les EU de \nLincoln. \nDébut de la guerre de Sécession.\n") end
Event[5] = {}
Event[5].date = string.format("%i%i", 2, 1865)
Event[5].func = function() CreatePopUp("Abolition de l'esclavage aux Etats-Unis", "Promulgation du 13ème amendement abolissant \nl'esclavage par A. Lincoln.\nFin de la guerre de Sécession") end
Event[6] = {}
Event[6].date = string.format("%i%i", 11, 1869)
Event[6].func = function() CreatePopUp("Inauguration du Canal de Suez", "L'impératrice Eugénie inaugure le Canal de Suez, \nsuivie par 77 navires de nations maritimes") crisisIndicator = -0.15 end
Event[7] = {}
Event[7].date = string.format("%i%i", 5, 1870)
Event[7].func = function() CreatePopUp("Création de Standard Oil", "Création de la compagnie pétrolière Standard Oil \npar John D. Rokefeller") end
Event[8] = {}
Event[8].date = string.format("%i%i", 3, 1871)
Event[8].func = function() CreatePopUp("Perte de l'Alsace Lorraine","Signature du traité de Frankfort. \nLa France perd l'Alsace Lorraine, territoire fortement industrialisé !") crisisIndicator = 0.18 end
Event[9] = {}
Event[9].date = string.format("%i%i", 11,1873)
Event[9].func = function() CreatePopUp("Crise économique Américaine", "La crise économique frappe les Etats-Unis de plein fouet.") crisisIndicator = 0.2 end
Event[10] = {}
Event[10].date = string.format("%i%i", 7,1879)
Event[10].func = function() CreatePopUp("Triomphe Républicain", "Les Républicains triomphent des conservateurs monarchistes et s'installent au pouvoir en France.") crisisIndicator = 0.05 end



function createEvent(date, func)
	if not type(func) == "string" then error("Func in createEvent() must be a string, retard") end
	local tbl = {}
	tbl.date = date -- string.format("%i%i", 5, 1852)
	tbl.func = func
	table.insert(DynaEvent, tbl)
end

function tutorialEvent(parameter)
	if parameter == 1 then
		CreatePopUp("Tutoriel","Avant de vous laisser continuer, faisons un tour \ndes fonctionnalités à votre disposition pour \ngérer votre banque !", {"Suivant", "Passer"}, {function() tutorialEvent(2) end,function() love.mouse.setCursor(c_default) end})	
	elseif parameter == 2 then
		CreatePopUp("Tutoriel","Passez votre souris sur la flèche à droite de \nl'écran et voyons ensemble les informations à \nvotre disposition", {"Suivant", "Passer"}, {function() tutorialEvent(2) end,function() love.mouse.setCursor(c_default) end})
	end
end

hook.Add("DateChange", "EventDateChange", function()
	for k, v in pairs(Event) do
		if not PassedEvents[k] then
			if v.date == string.format("%i/%i", T_MONTH, T_YEAR)	then
				v.func()
				PassedEvents[k] = true;
			end
		end
	end
	
end)

hook.Add("DateChange", "DynaEventDateChange", function()
	local func = nil
	for k, v in pairs(DynaEvent) do
		if v.date == string.format("%i/%i/%i",T_SEM , T_MONTH, T_YEAR)	then
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
		addMoney(monthlyEarning, "Compte clients")
	end
	if T_MONTH == 1 and T_SEM == 1 and T_DAY == 1 then
		addMoney(-annualPayment, "Dividendes")
	end
end)

hook.Add("DateChange", "Taux Directeur", function()
	if T_SEM == 1 and T_DAY == 1 and T_MONTH == 1 then -- début de l'année
		mainRate = math.random(1750,2250)/1000
	end
end)
