require("modules/hook")


hook.Add("DateChange", "PuBClientCalc", function()
	local nbInvestisseursCopy
	local baseMoney, baseTime, baseRate = 0
	if (T_SEM == 1 or T_SEM == 2 or T_SEM == 3 or T_SEM == 4) and T_DAY == 1 then
		newClients = (connaissanceBanque - nbClients) * (engouement * math.max(reputation, 0.1))/10000
		newClients = math.Round(newClients, 0)
		if newClients + nbClients > nbEmployees * (30 * employeeEfficiency) then
			newClients =  (nbEmployees * (30 * employeeEfficiency)) - nbClients 
			nbClients = newClients + nbClients
		else
			nbClients = nbClients + newClients
		end
		newCrediteurs = (newClients / 100) * (10 + math.random(-4,4))
		clientProfilGen(newClients)
		if engouement > 0.1 then engouement = engouement - 0.05 end
	end
	if (T_MONTH == 6 or T_MONTH == 12) and T_SEM == 1 and T_DAY == 1 then
		newInvestisseurs = math.Round((nbClients / 1000)*(reputation + engouement * 17), 0)
		if newInvestisseurs > 5 then newInvestisseurs = 5 end
		nbInvestisseurs = nbInvestisseurs + newInvestisseurs
		while newInvestisseurs > 0 do
			local pos = nbInvestisseurs-newInvestisseurs
			baseMoney = math.Round(math.random(minimalInvestment/1000,10000), 0) * (nbClients/100)
			baseTime = math.Round(math.random(minimalTimeInvestment, 200), 0)
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
		monthlyEarning = monthlyEarning + clientMoney*0.09
		annualPayment = annualPayment + clientMoney*(minimalRendement/100)
		totalClientMoney = totalClientMoney + clientMoney
		lowProfile = lowProfile - 1
	end
	while midProfile > 0 do
		clientMoney = math.Round(math.random(1001,6000), 0)
		monthlyEarning = monthlyEarning + clientMoney*0.14
		annualPayment = annualPayment + clientMoney*(middleRendement/100)
		totalClientMoney = totalClientMoney + clientMoney
		midProfile = midProfile - 1
	end
	while highProfile > 0 do
		clientMoney = math.Round(math.random(6001,12000), 0)
		monthlyEarning = monthlyEarning + clientMoney*0.3
		annualPayment = annualPayment + clientMoney*(maximalRendement/100)
		totalClientMoney = totalClientMoney + clientMoney
		highProfile = highProfile - 1
	end
	addMoney(totalClientMoney, "Nouveaux clients")
end

function creditProfilGen(newCrediteurs)
	local crediteurAsk = 0
	local crediteurTime = 0
	local crediteurIncomes = 0 

	while newCrediteurs > 0 do
		crediteurAsk = math.Round(math.random(10,100))
		crediteurTime = math.Round(math.random(12,240))
		crediteurIncome = crediteurAsk/crediteurTime * (10 + math.random(-5,5))

		if crediteurAsk <= lowCrediteurAsk then finalBehoof= minimalCrediteurAskBehoof
		elseif crediteurAsk <= middleCrediteurAsk then finalBehoof = middleCrediteurAskBehoof
		elseif crediteurAsk > middleCrediteurAsk then finalBehoof = maximalCrediteurAskBehoof end

		if crediteurTime <= lowCrediteurTime then finalBehoof = finalBehoof + minimalCrediteurTimeBehoof
		elseif crediteurTime <= middleCrediteurTime then finalBehoof = finalBehoof + middleCrediteurTimeBehoof
		elseif crediteurTime > middleCrediteurTime then finalBehoof = finalBehoof + maximalCrediteurTimeBehoof end

		if crediteurIncomes <= lowCrediteurIncomes then finalBehoof = finalBehoof + minimalCrediteurIncomesBehoof
		elseif crediteurIncomes <= middleCrediteurIncomes then finalBehoof = finalBehoof + middleCrediteurIncomesBehoof
		elseif crediteurIncomes > middleCrediteurIncomes then finalBehoof = finalBehoof + maximalCrediteurIncomesBehoof end

		monthlyEarning = monthlyEarning + (crediteurAsk*1000 + (crediteurAsk*10 * finalBehoof))/crediteurTime
		local x,y,z = calculateDate(T_SEM,T_MONTH,T_YEAR, crediteurTime * 31)
		createEvent(string.format("%i/%i/%i",x,y,z), "monthlyEarning = monthlyEarning -  "..  (crediteurAsk*1000 + (crediteurAsk*10 * finalBehoof))/crediteurTime)
		addMoney(-crediteurAsk*1000, "Crédit")
		newCrediteurs = newCrediteurs - 1
	end
end
