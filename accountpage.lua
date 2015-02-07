function accountInfos()
	local account_growth = 0

	love.graphics.setColor(75,75,75)
	love.graphics.rectangle("fill",29, 89, 602, 502)
	love.graphics.setColor(248,249,251)
	love.graphics.rectangle("fill",30, 90, 600, 500)
	love.graphics.setColor(47,46,54)
	love.graphics.setFont(title)
	love.graphics.print("Mon Compte Virtuel", 30, 50)
	love.graphics.setFont(subtitle)
	love.graphics.print("Argent du portefeuille : $" .. math.Round(account_virtual_money* (1/1.1315)*100)/100 .. " / " .. math.Round(account_virtual_money *100)/100 .. "€", 42, 180)
	love.graphics.print("Croissance : ", 42, 210)
	if account_growth > 0 then
		love.graphics.setColor(0,255,127)
		love.graphics.print("+" .. math.Round(account_growth*100)/100 .. "%", 42 + subtitle:getWidth("Croissance : "), 210)
	else
		love.graphics.setColor(235,12,12)
		love.graphics.print("-" .. math.Round(account_growth*100)/100 .. "%", 42 + subtitle:getWidth("Croissance : "), 210)
	end
	love.graphics.setColor(47,46,54)
	love.graphics.print("Mode du jeu : Découverte", 42, 555)
	love.graphics.print("Liste des actions : ", 742, 130)
end

function accountBought()
	local i = 1
	action_list = loveframes.Create("columnlist")
	action_list:SetPos(742, 160)
	action_list:SetSize(400, 400)
	action_list:AddColumn("Entreprise")
	action_list:AddColumn("Nombre")
	action_list:AddColumn("Valeur unit.")
	action_list:AddColumn("Valeur tot.")
	for k, v in pairs(bought_objects) do
		if v > 0 and not string.EndsWith(k, "_value") then 
			action_list:AddRow(k, v, "$" .. bank.corpo_get_infos(k).LastPrice , "$" .. v * bank.corpo_get_infos(k).LastPrice)
		end
	end
end
