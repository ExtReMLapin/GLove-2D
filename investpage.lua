local multichoice_invest;
Brand = {}
	Brand[1] = {}
	Brand[2] = {}
	Brand[3] = {}
	Brand[4] = {}
	Brand[5] = {}
	Brand[6] = {}
	Brand[7] = {}
	Brand[8] = {}

	Brand[1].Name = "AMD"
	Brand[1].rn = "AMD"
	Brand[2].Name = "NVIDIA"
	Brand[2].rn = "NVDA"
	Brand[3].Name = "INTEL"
	Brand[3].rn = "INTC"
	Brand[4].Name = "Wall-Mart"
	Brand[4].rn = "WMT"
	Brand[5].Name = "Apple"
	Brand[5].rn = "AAPL"
	Brand[6].Name = "Facebook"
	Brand[6].rn = "Facebook"
	Brand[7].Name = "Microsoft"
	Brand[7].rn = "MSFT"
	Brand[8].Name = "Google"
	Brand[8].rn = "GOOGL"





function investMenu(corp)
	if not multichoice_invest then
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
	love.graphics.draw_nicegraph(610, 390, 540, 235, bank.corpo_get_value_date(corp,90))
	investDetails(corp)
	love.graphics.print(Globalcorpname or "")

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
	multichoice_invest = loveframes.Create("multichoice", frame)
	multichoice_invest:SetPos(300, 150)
	for k, v in pairs(Brand) do
		multichoice_invest:AddChoice(v.Name)
	end

	multichoice_invest.OnChoiceSelected = function(object, choice)
  		investCorpname(choice)
	end


end

function investCorpname(name)
	Globalcorpname = name
end