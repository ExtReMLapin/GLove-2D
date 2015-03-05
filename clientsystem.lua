require("modules/hook")


hook.Add("DateChange", "PuBClientCalc", function()
	if T_SEM == 1 and T_DAY == 1 or  T_SEM == 3 and T_DAY == 1 then
		nbClients = nbClients + (Popularity*2)
		nbClients = nbClients + (nbClients*0.02)
		Popularity = math.Max(0,Popularity-4)
	end
end)







