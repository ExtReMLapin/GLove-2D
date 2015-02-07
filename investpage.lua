local slider1;
local slider2;
local posg = 0.5
local zoomg = 0.1
number_actions = 0
bought_objects = {}


local time = os.time()

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


function investSliders()
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


function investMenu(corp)
	local x,y;
	x,y = love.mouse.getPosition()
	local clic_gauche = love.mouse.isDown("l")
	love.graphics.setColor(47,46,54)
	love.graphics.setFont(subtitle)
	PrintTable(bought_objects)

	if x > 53 and x < 53 + subtitle:getWidth("Acheter ") and y > 500 and y < 500 + subtitle:getHeight() then
		love.graphics.setColor(222,31,85)
		love.graphics.print("Acheter ", 53, 500)
		if clic_gauche == true and os.time() > time then
			time = os.time()+0.99
			if account_virtual_money > (bank.corpo_get_infos(Globalcorpname).LastPrice * number_actions) then
			
				if not bought_objects[Globalcorpname] then
					bought_objects[Globalcorpname] = number_actions
				else
		 			bought_objects[Globalcorpname] = bought_objects[Globalcorpname] + number_actions
				end
				account_virtual_money = account_virtual_money - (bank.corpo_get_infos(Globalcorpname).LastPrice * number_actions * 0.8839)
			end
		end
	else
		love.graphics.print("Acheter ", 53, 500)
	end
	love.graphics.setColor(47,46,54)
	if x > 53 and x < 53 + subtitle:getWidth("Vendre ") and y > 580 and y < 580 + subtitle:getHeight() then
		love.graphics.setColor(222,31,85)
		love.graphics.print("Vendre ", 53, 580)
		if clic_gauche == true and os.time() > time then
			time = os.time()+0.99
	 		if bought_objects[Globalcorpname] then 
				if bought_objects[Globalcorpname] > number_actions then
					bought_objects[Globalcorpname] = bought_objects[Globalcorpname] - number_actions
				else
					bought_objects[Globalcorpname] = 0
				end
			end
			
		end
	else
		love.graphics.print("Vendre ", 53, 580)
	end
	
	love.graphics.setFont(title)
	love.graphics.setColor(47,46,54)
	love.graphics.print("Investir", 30, 50)
	
	love.graphics.setColor(75,75,75)
	love.graphics.rectangle("fill", 639, 89, 542, 242) -- border
	love.graphics.setColor(248,249,251)
	love.graphics.rectangle("fill", 640, 90, 540, 240)

	love.graphics.setColor(255,255,255)
	love.graphics.draw_nicegraph(640, 350, 540, 235, bank.corpo_get_value_date(corp),posg, zoomg )
	investDetails(corp)

end

function investDetails(corp)
    local tbl = bank.corpo_get_value_date(corp)
    local codename = tbl.Elements[1].Symbol
    local realname = bank.corpo_get(codename).Name
    local currency = tbl.Elements[1].Currency
    firstcur = firstcur or 0.1
    lastcur = lastcur or 1
    love.graphics.setColor(47,46,54)
    love.graphics.setFont(other_text)
    love.graphics.print("Symbole : " .. codename, 675, 160)
    love.graphics.print("Nom réel : " .. realname, 675, 195)
    love.graphics.print("Valeur max. d'achat : $" .. (maxcur or "???"), 675, 230)
    love.graphics.print("Valeur min. d'achat : $" .. (mincur or "???"), 675, 265)
    
    if ((lastcur-firstcur)/firstcur*100) > 0 then
    	love.graphics.setColor(0,255,127)
    else 
    	love.graphics.setColor(220,20,60) 
    end
    love.graphics.print("Variance : " .. math.Round(((lastcur-firstcur)/firstcur*2000))/20 .. "%", 675, 300)

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
		Globalcorpname = choice
		number_actions = 0
  		investCorpname(choice)
	end
end

function investCorpname(name)
	Globalcorpname = name
end

function investBuyOrSell()
	buynumberbox = loveframes.Create("numberbox")
	buynumberbox:SetPos(450, 500)
	buynumberbox:SetSize(70,25)
	buynumberbox.OnValueChanged = function(object, value)
		number_actions = value
	end
	sellnumberbox = loveframes.Create("numberbox")
	sellnumberbox:SetPos(450, 580)
	sellnumberbox:SetSize(70,25)
	sellnumberbox.OnValueChanged = function(object, value)
		number_actions = value
	end
end