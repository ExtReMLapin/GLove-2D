require("modules/hook")


hook.Add("DateChange", "PuBClientCalc", function()
	if T_SEM == 1 and T_DAY == 1  then
		nbClients = nbClients + (Popularity*4)
		nbClients = nbClients + (nbClients*0.04)
	end
end)







