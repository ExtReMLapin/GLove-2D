function investMenu(corp)
	if not multichoice then
		local image = loveframes.Create("image", frame)
		image:SetImage("ressources/image.png")
		image:SetPos(30, 90)
		investList()
		investSearch()
	end
	love.graphics.setColor(255,255,255)
	love.graphics.print("Investir", 30, 50)
	
	love.graphics.setColor(104,102,102)
	love.graphics.rectangle("fill", 610, 90, 540, 270)

	love.graphics.setColor(255,255,255)
	love.graphics.draw_nicegraph(610, 390, 540, 235, bank.corpo_get_value_date(corp))
	investDetails(corp)
	love.graphics.print(corpname)

end

function investDetails(corp)
    local tbl = bank.corpo_get_value_date(corp, 90)
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
	search = loveframes.Create("textinput")
	search:SetPos(400, 95)
	search:SetWidth(170)
	search:SetHeight(20)
end

function investList()
<<<<<<< Updated upstream
	multichoice = loveframes.Create("list")
	multichoice:SetPos(33, 150)
=======
	multichoice = loveframes.Create("multichoice")
	multichoice:SetPos(30, 150)
>>>>>>> Stashed changes
	multichoice:SetWidth(540)
	multichoice:SetHeight(390)
	button1 = loveframes.Create("button")
	button1:SetText("AMD")
	multichoice:AddItem(button1)
	button1.OnClick = investCorpname("AMD")
	button2 = loveframes.Create("button")
	button2:SetText("NVIDIA")
	multichoice:AddItem(button2)
	button2.OnClick = investCorpname("NVIDIA")
	button3 = loveframes.Create("button")
	button3:SetText("APPLE")
	multichoice:AddItem(button3)
	button3.OnClick = investCorpname("APPLE")
	button4 = loveframes.Create("button")
	button4:SetText("MICROSOFT")
	multichoice:AddItem(button4)
	button4.OnClick = investCorpname("MICROSOFT")

end

function investCorpname(name)
	corpname = name
end