local multichoice_invest;
local slider1;
local slider2;
local posg = 0.5
local zoomg = 0.1
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
	Brand[4].Name = "Netflix"
	Brand[4].rn = "NFLX"
	Brand[5].Name = "Apple"
	Brand[5].rn = "AAPL"
	Brand[6].Name = "Facebook"
	Brand[6].rn = "Facebook"
	Brand[7].Name = "Microsoft"
	Brand[7].rn = "MSFT"
	Brand[8].Name = "Google"
	Brand[8].rn = "GOOGL"




function investMenu(corp)

	love.graphics.setColor(47,46,54)
	love.graphics.print("Investir", 30, 50)
	
	love.graphics.setColor(248,249,251)
	love.graphics.rectangle("fill", 640, 90, 540, 270)

	love.graphics.setColor(255,255,255)
	love.graphics.draw_nicegraph(640, 350, 540, 235, bank.corpo_get_value_date(corp),posg, zoomg )
	investDetails(corp)

	if not slider1 then
		slider1 = loveframes.Create("slider", frame)
		slider1:SetPos(640, 600)
		slider1:SetWidth(290)
		slider1:SetMinMax(0, 1)
		         
		slider2 = loveframes.Create("slider", frame)
		slider2:SetPos(640, 620)
		slider2:SetWidth(290)
		slider2:SetMinMax(0, 2)
		slider1.OnValueChanged = function(object)
			posg = object:GetValue()
		end

		slider2.OnValueChanged = function(object)
			zoomg = object:GetValue()
		end
	end
end




function investDetails(corp)
    local tbl = bank.corpo_get_value_date(corp, 90)
    local codename = tbl.Elements[1].Symbol
    local realname = bank.corpo_get(codename).Name
    local max = tbl.Elements[1].DataSeries.close.values[table.GetWinningKey(tbl.Elements[1].DataSeries.close.values)]
    local min = tbl.Elements[1].DataSeries.close.values[table.GetLoosingKey(tbl.Elements[1].DataSeries.close.values)]
    local currency = tbl.Elements[1].Currency
    love.graphics.setColor(47,46,54)
    love.graphics.setFont(other_text)
    love.graphics.print("Symbole : " .. codename, 675, 160)
    love.graphics.print("Nom réel : " .. realname, 675, 195)
    love.graphics.print("Valeur max. d'achat : $" .. max, 675, 230)
    love.graphics.print("Valeur min. d'achat : $" .. min, 675, 265)
	love.graphics.setColor(47,46,54)
	love.graphics.setFont(subtitle)
	love.graphics.print("Détails :", 645, 92)
end

function investList()
	multichoice_invest = loveframes.Create("multichoice", frame)
	multichoice_invest:SetPos(33, 93)
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