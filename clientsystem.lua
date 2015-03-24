require("modules/hook")


hook.Add("DateChange", "PuBClientCalc", function()
	local nbInvestisseursCopy
	local baseMoney, baseTime, baseRate = 0
	if T_SEM == 1 and T_DAY == 1 or  T_SEM == 3 and T_DAY == 1 then
		newClients = Popularity*2
		if (nbClients + newClients) + (nbClients + newClients)*0.02  < nbEmployees * 30 then
			nbClients = nbClients + newClients
			nbClients = nbClients + (nbClients*0.02)
		else
			newClients = (nbEmployees*30) - nbClients
			nbClients = nbEmployees*30
		end
		clientProfilGen(newClients)
		Popularity = math.Max(0,Popularity-0.5)
	end
	if (T_MONTH == 6 or T_MONTH == 12) and T_SEM == 1 and T_DAY == 1 then
		newInvestisseurs = math.Round((nbClients / 1000)*Popularity, 0)
		if newInvestisseurs > 5 then newInvestisseurs = 5 end
		nbInvestisseurs = nbInvestisseurs + newInvestisseurs
		while newInvestisseurs > 0 do
			local pos = nbInvestisseurs-newInvestisseurs
			baseMoney = math.Round(math.random(minimalInvestment/1000,maximalInvestment/1000), 0) * (nbClients/100)
			baseTime = math.Round(math.random(minimalTimeInvestment, maximalTimeInvestment), 0)
			baseRate = tauxInvestisseur(baseMoney,baseTime) / 100
			addMoney(baseMoney, "Investissement")
			annualPayment = (annualPayment or 0) + baseMoney*baseRate
			local x,y,z = calculateDate(T_SEM,T_MONTH,T_YEAR, baseTime * 31)
			createEvent(string.format("%i/%i/%i",x,y,z), "Money = Money - ".. baseMoney)
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

function clientProfilGen(newClients)
	local lowProfile = math.Round(newClients/3)
	local midProfile = math.Round(newClients/1.5)
	local highProfile = newClients - (lowProfile + midProfile)
	local clientMoney = 0
	totalClientMoney = 0

	while lowProfile > 0 do
		clientMoney = math.Round(math.random(20,1000), 0)
		annualPayment = annualPayment + clientMoney*0.031
		totalClientMoney = totalClientMoney + clientMoney
		lowProfile = lowProfile - 1
	end
	while midProfile > 0 do
		clientMoney = math.Round(math.random(1001,6000), 0)
		annualPayment = annualPayment + clientMoney*0.031
		totalClientMoney = totalClientMoney + clientMoney
		midProfile = midProfile - 1
	end
	while highProfile > 0 do
		clientMoney = math.Round(math.random(6001,12000), 0)
		annualPayment = annualPayment + clientMoney*0.031
		totalClientMoney = totalClientMoney + clientMoney
		highProfile = highProfile - 1
	end
	addMoney(totalClientMoney, "Nouveaux clients")
end
