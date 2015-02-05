function investMenu()
	love.graphics.setColor(255,255,255)
	love.graphics.print("Investir", 30, 50)

	love.graphics.setColor(104,102,102)
	love.graphics.rectangle("fill", 30, 90, 550, 540)
	love.graphics.rectangle("fill", 610, 90, 540, 270)

	investDetails()

	love.graphics.setColor(255,255,255)
	love.graphics.draw_nicegraph(610, 390, 540, 235, bank.corpo_get_value_date("NVDA"))
end

function investDetails()
	local corp_name = "NVDA"
    local tbl = bank.corpo_get_value_date(corp_name)
    local codename = tbl.Elements[1].Symbol
    local realname = bank.corpo_get(codename).Name
    local max = tbl.Elements[1].DataSeries.close.values[table.GetWinningKey(tbl.Elements[1].DataSeries.close.values)]
    local min = tbl.Elements[1].DataSeries.close.values[table.GetLoosingKey(tbl.Elements[1].DataSeries.close.values)]
    local currency = tbl.Elements[1].DataSeries.close.values[table.CloseValue(tbl.Positions, gesposongraph(x, y, w, h))]
    love.graphics.setFont(15)
    love.graphics.printf("Symbole : " .. codename, 615, 98)
    love.graphics.printf("Nom réel : " .. realname, 615, 104)

	love.graphics.setColor(48,187,229)
	love.graphics.setFont(subtitle)
	love.graphics.print("Détails :", 615, 92)
end