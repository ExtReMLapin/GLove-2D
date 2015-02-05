function investMenu(corp)
	if not multichoice then
		
		love.graphics.setColor(255,255,255)
		love.graphics.print("Investir", 30, 50)
	
		love.graphics.setColor(104,102,102)
		love.graphics.rectangle("fill", 30, 90, 550, 540)
		love.graphics.rectangle("fill", 610, 90, 540, 270)

		love.graphics.setColor(255,255,255)
		love.graphics.draw_nicegraph(610, 390, 540, 235, bank.corpo_get_value_date(corp))
		investList()
		investSearch()
				investDetails(corp)
	end
end

function investDetails(corp)
    local tbl = bank.corpo_get_value_date(corp)
    local codename = tbl.Elements[1].Symbol
    local realname = bank.corpo_get(codename).Name
    local max = tbl.Elements[1].DataSeries.close.values[table.GetWinningKey(tbl.Elements[1].DataSeries.close.values)]
    local min = tbl.Elements[1].DataSeries.close.values[table.GetLoosingKey(tbl.Elements[1].DataSeries.close.values)]
    local currency = tbl.Elements[1].Currency
    love.graphics.setColor(255,255,255)
    love.graphics.setFont(graphfont)
    love.graphics.print("Symbole : " .. codename, 615, 130)
    love.graphics.print("Nom réel : " .. realname, 615, 145)
    love.graphics.print("Valeur max. d'achat : $" .. max, 615, 160)
    love.graphics.print("Valeur min. d'achat : $" .. min, 615, 175)

	love.graphics.setColor(48,187,229)
	love.graphics.setFont(subtitle)
	love.graphics.print("Détails :", 615, 92)
end

function investSearch(x, y)
	love.graphics.setColor(255,255,255)
	search = loveframes.Create("textinput")
	search:SetPos(400, 95)
	search:SetWidth(170)
	search:SetHeight(20)
end

function investList()
	local multichoice = loveframes.Create("multichoice")
	multichoice:SetPos(30, 150)
	multichoice:SetWidth(540)
	multichoice:SetHeight(390)
	multichoice:AddChoice("AMD")
	multichoice:AddChoice("NVIDIA")
	multichoice:AddChoice("APPLE")
	multichoice:AddChoice("MICROSOFT")
end