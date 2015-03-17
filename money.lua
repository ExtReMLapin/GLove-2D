require("modules/hook")

local cash = love.audio.newSource("ressources/cash.ogg", "static")

cash:setVolume(0.3)
cash:setPitch(1) 

function addMoney(num, reason)
	if num == 0 then return end -- really ?
	num = math.Round(numy)
	Money = Money + num
	hook.Call("MoneyAdd", num, reason or "Dépenses")
	cash:play()
end


function endGame()
print("ded lel")
timer.remove("MainTimerDate")
end


hook.Add("MoneyAdd", "AutoSafeOnMoneyChange", function()
		do_save_data()
		if Money < 0  then
			if nbClients > 10000  then
				if Passed3mLimit == false then
					Passed3mLimit = true
					CreatePopUp("Y'a pu de pilles !", "Le coffre de la banque est vide !\nPerdez encore 1 million de francs ou passez\nen dessous des 10k clients et c'est la fin !\nMais pour le moment votre banque pour encore tourner\nsur l'argent de vos clients ...")
				end
				if Money < -3000000 then
					endGame()
				end
			else
				CreatePopUp("La fin des carottes.", "Plus d'argent dans le coffre.\nPlus de client à la porte.\nC'est toi qui prend la porte\nFais tes affaires et met la clée sous la porte.")
				endGame()
			end
		end
end)


