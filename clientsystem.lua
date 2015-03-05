require("modules/hook")


hook.Add("DateChange", "PuBClientCalc", function()
	if T_SEM >= 1 and T_SEM <= 4 and T_DAY == 1  then
		nbClients = nbClients + (Popularity)
		nbClients = nbClients + (nbClients*0.01)
	end
end)







