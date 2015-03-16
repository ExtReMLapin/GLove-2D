require("modules/hook")


hook.Add("DateChange", "PuBClientCalc", function()
	local nbInvestisseursCopy
	if T_SEM == 1 and T_DAY == 1 or  T_SEM == 3 and T_DAY == 1 then
		nbClients = nbClients + (Popularity*2)
		nbClients = nbClients + (nbClients*0.02)
		Popularity = math.Max(0,Popularity-0.5)
	end
	if T_MONTH == 6 or T_MONTH == 12 then
		newInvestisseurs = (nbClients / 1000)*Popularity
		nbInvestisseurs = nbInvestisseurs + newInvestisseurs
		moneyInvestisseur = math.random(minimalInvestment/100,maximalInvestment/100) * nbClients
		while newInvestisseurs > 0 do
			local pos = nbInvestisseurs-newInvestisseurs
			tabInvestisseurs[pos] = {}
			tabInvestisseurs[pos].money = math.random(minimalInvestment/100,maximalInvestment/100) * nbClients
			tabInvestisseurs[pos].time = math.random(minimalTimeInvestment, maximalTimeInvestment)
			tabInvestisseurs[pos].rate = tauxInvestisseur(tabInvestisseurs[pos].money,tabInvestisseurs[pos].time) / 100
			Money = Money + tabInvestisseurs[pos].money
			annualPayment = (annualPayment or 0) + tabInvestisseurs[pos].money*tabInvestisseurs[pos].rate
			local x,y,z = calculateDate(T_DAY,T_MONTH,T_YEAR,tabInvestisseurs[pos].time * 31)
			createEvent(string.format("%i%i%i",x,y,z), "Money = Money - tabInvestisseurs[pos].money")
			newInvestisseurs = newInvestisseurs - 1
		end
	end
end)

function tauxInvestisseur(money,time)
	local taux = 0
	if money > minimalInvestment and money < middle1Investment then
		taux = minimalRendement
	elseif money > middle1Investment and money < middle2Investment then
		taux = middleRendement
	elseif money > middle2Investment and money < maximalInvestment then
		taux = maximalRendement
	end
	if time > minimalTimeInvestment and time < middle1TimeInvestment then
		taux = taux + minimal2Rendement
	elseif time > middle1TimeInvestment and time < middle2TimeInvestment then
		taux = taux + middle2Rendement
	elseif time > middle2TimeInvestment and time < maximalTimeInvestment then
		taux = taux + maximal2Rendement
	end
	return taux
end