width, height = love.graphics.getDimensions()
require"data"
surface = {}
draw = {}

local love = love
local table = table
local math = math
local string = string
ScrW, ScrH = love.window.getDimensions( )

function Color(ra,ga,ba,aa)
	return {r = ra, g=ga, b=ba, a=aa or 255}
end

color_white = Color(255,255,255)
color_black = Color(0,0,0)

function surface.DrawRect(x, y, width, height)
	return love.graphics.rectangle( "fill", x, y, width, height )
end


function surface.SetDrawColor(tbl)
	love.graphics.setColor(tbl.r,tbl.g,tbl.b,tbl.a)
end


function love.graphics.draw_graph(x, y, w, h, tbl)
	love.graphics.setColor(28,154,211)
	local tmptbl = {}
	local max = tbl[table.GetWinningKey(tbl)]
	local min = tbl[table.GetLoosingKey(tbl)]
	local dy = 0
	local dx = 0
	local numkeys = #tbl

	for k, v in pairs(tbl) do
		i = (k-1)*2 + 1
		dx = math.Remap(k, 1, numkeys , x, w+x)
		dy = height - (height-(h+y)) - (math.Remap(v, min, max, y+10, h+y-10)) + y
		tmptbl[i] = dx
		tmptbl[i+1] = dy
	end
	love.graphics.rectangle("line", x, y, w, h )
	--love.graphics.polygon("fill",tmptbl)
	love.graphics.line(tmptbl)
end

function gesposongraph(x, y, w, h)
	xpos, ypos = love.mouse.getPosition()
	return math.Remap(xpos,x, x+w, 0, 1)
end

function gesposongraph2(x, w,y)
	return math.Remap(y,x, x+w, 0, 1)
end


local fnt1 = love.graphics.newFont()
local fnt2 = love.graphics.newFont(10)

function table.Rearange(tbl)
	local tbl2 = {}
	i = 0
	for k, v in pairs(tbl) do
		tbl2[k] = math.Remap(i, 0, #tbl, 0, 1)
		i = i+1
	end
	return tbl2
end

local zoom = 0.1
local pos = 0.99

function love.graphics.draw_nicegraph(x, y, w, h, tbl)

	local xpos, ypos = love.mouse.getPosition( )
	if (xpos > x and xpos < x+w ) and (ypos > y and ypos < y+h ) then -- in the frame
		
		if MOUSE_STATE then -- clicking ?
			pos = (pos - (((MOUSE_S_X - xpos)*zoom)/x)/2)
			zoom = (zoom - ((MOUSE_S_Y - ypos)/y/2))
			love.mouse.setCursor(c_size)

		else
			love.mouse.setCursor(c_hand)
		end
	else
		love.mouse.setCursor(c_default)
	end

	zoom = math.Min(math.Max( 0.1, zoom),2) or 0.5
	pos = math.Min(math.Max( 0.1, pos),1)  or 0.5
	love.graphics.setFont(graphfont)
	love.graphics.setColor(255,255,255)
	local codename = tbl.Elements[1].Symbol
	local realname = bank.corpo_get_infos(codename).Name
	local tbl1 = table.Cut( tbl.Elements[1].DataSeries.close.values, pos-zoom/2, pos+zoom/2 )
	local tbl2 = table.Cut( tbl.Positions , pos-zoom/2, pos+zoom/2 )
	local tbl3 = table.Cut( tbl.Dates , pos-zoom/2, pos+zoom/2 )
	tbl2 = table.Rearange(tbl2)
	local max = tbl1[table.GetWinningKey(tbl1)]
	local min = tbl1[table.GetLoosingKey(tbl1)]
	maxcur = max
	mincur = min
	firstcur = tbl1[table.CloseValue(tbl2, 0)]
	lastcur = tbl1[table.CloseValue(tbl2, 1)]
	local dolla = tbl1[table.CloseValue(tbl2, gesposongraph(x, y, w, h))]
	local date = string.gsub(tbl3[table.CloseValue(tbl2, gesposongraph(x, y, w, h))], "T00:00:00", "")
	
	love.graphics.draw_graph(x, y, w, h, tbl1)
	if (xpos > x and xpos < x+w ) and (ypos > y and ypos < y+h ) and not MOUSE_STATE then
		love.graphics.line(xpos, y, xpos, y+h)
		--love.graphics.line(x,ypos, x+w, ypos)
		love.graphics.print("Value : ".. dolla .. " " .. tbl.Elements[1].Currency, xpos +20, ypos +10)
		love.graphics.print(date, xpos +20, ypos +25)


	end

	--local l = fnt1:getWidth("Brand Name : " .. realname) +11
	--love.graphics.rectangle("line", x+w-l, y+h, l, 35 )
	--love.graphics.print("UID : " .. codename,x+w-l+4, y+h+3 )
	
	
	if h > 100 then
		local i = 0;
		love.graphics.setFont( fnt2 )
		while (i < height) do
			if (i > y and i < y+h) and i%50 == 1 then
				local val = math.Remap(i,y+h,y,min,max)
				val = math.Round(val*10)
				val = val/10
				local len = fnt2:getWidth(val)
				love.graphics.print(val,x-len-5, i )
			end
			i = i+1
		end 
	end

	if w > 300 then
		local i = 0;
		love.graphics.setFont( fnt2 )
		while (i < width) do
			if (i > x and i < x+w) and i%170 == 1 then
				--tbl3[table.CloseValue(tbl2, gesposongraph(i, y, w, h))]
				local val = string.gsub(tbl3[table.CloseValue(tbl2, gesposongraph2(i,x,w ))], "T00:00:00", "")
				local len = fnt2:getHeight(val)
				love.graphics.print(val,i, y+h+len-7 )
			end
			i = i+1
		end 
	end

end

local g_grds, g_wgrd, g_sz
function draw.GradientBox(x, y, w, h, al, ...) -- DO NOT USE, GLITCHY WTF BRO
	g_grds = {...}
	al = math.Clamp(math.floor(al), 0, 1)
	if(al == 1) then
		local t = w
		w, h = h, t
	end
	g_wgrd = w / (#g_grds - 1)
	local n
	for i = 1, w do
		for c = 1, #g_grds do
			n = c
			if(i <= g_wgrd * c) then break end
		end
		g_sz = i - (g_wgrd * (n - 1))
		surface.SetDrawColor(Color(
			Lerp2(g_sz/g_wgrd, g_grds[n].r, g_grds[n + 1].r),
			Lerp2(g_sz/g_wgrd, g_grds[n].g, g_grds[n + 1].g),
			Lerp2(g_sz/g_wgrd, g_grds[n].b, g_grds[n + 1].b),
			Lerp2(g_sz/g_wgrd, g_grds[n].a, g_grds[n + 1].a)))
		if(al == 1) then surface.DrawRect(x, y + i, h, 1)
			else surface.DrawRect(x + i, y, 1, h) end
		end
	end

function WindowsLoadingBarUndefined(xpos, ypos, x, y, speed, colorbg, color)-- yess
	local pos1 = xpos+x*math.tan(love.timer.getTime()*speed)
	local bordermax =  math.Max(0, (pos1+x/5)-(xpos+x))
	local bordermin =  math.Max(0, (xpos+x/5)-(pos1))

	surface.SetDrawColor(colorbg) -- Background
	surface.DrawRect(xpos, ypos, x, y)

	

	if (pos1+x/5 > xpos) and (pos1 < xpos+x) and pos1 > xpos then -- Last is a quick fix for 3d rendering
		--draw.GradientBox(pos1, ypos, ( (x/5)- bordermax - bordermin ), y,1, color1, color2)
		surface.SetDrawColor(color) -- Background
		surface.DrawRect(pos1, ypos, ( (x/5)- bordermax - bordermin ), y)
	end
end


function WindowsLoadingBarDefined(xpos, ypos, x, y, speed, colorbg, color, state )-- 0-1 for the state
	surface.SetDrawColor(colorbg)
	surface.DrawRect(xpos, ypos, x, y)
	surface.SetDrawColor(color) -- Background
	surface.DrawRect(xpos, ypos,x*state, y)

end


local right = 0
local left = math.pi
local bottom = math.pi * 0.5
local top = math.pi * 1.5

function surface.RoundedBox(x, y, w, h, r)
	r = r or 15
	love.graphics.rectangle("fill", x, y+r, w, h-r*2)
	love.graphics.rectangle("fill", x+r, y, w-r*2, r)
	love.graphics.rectangle("fill", x+r, y+h-r, w-r*2, r)
	love.graphics.arc("fill", x+r, y+r, r, left, top)
	love.graphics.arc("fill", x + w-r, y+r, r, -bottom, right)
	love.graphics.arc("fill", x + w-r, y + h-r, r, right, bottom)
	love.graphics.arc("fill", x+r, y + h-r, r, bottom, left)
end




function surface.HUDStaticBox(x, y, w, h)
	local ang = 3
	love.graphics.setColor(164,164,164)
	surface.RoundedBox(x-2, y-2, w+4, h+4, ang+1)
	love.graphics.setColor(255,255,255)
	surface.RoundedBox(x, y, w, h, ang)
end


local mois = { "Jan.",
				"Fév.",
				"Mars",
				"Avr.",
				"Mai",
				"Juin",
				"Juil.",
				"Août",
				"Sept.",
				"Oct.",
				"Nov.",
				"Déc."}



function DrawDateBox()
	surface.HUDStaticBox(ScrW-233, 12, 225, 145)
	love.graphics.setFont( date_box_text1 )
	love.graphics.setColor(0,0,0)
	love.graphics.print(string.format("%s %i %s", mois[T_MONTH] ,T_YEAR, tostring("semaine " .. T_SEM) ), ScrW-220, 20)
	local i = 0
	while i < T_DAY do
		surface.RoundedBox(ScrW-25, 19+(4*i), 3,3,3)
		i = i+1
	end
	if Money > 0 then 
		love.graphics.setColor(0,128,0)
	else
		love.graphics.setColor(128,0,0)
	end
	love.graphics.print(string.nicemath(Money), ScrW-148, 45)
	love.graphics.setColor(0,0,0)
	love.graphics.print("Capital :", ScrW-220, 45)
	love.graphics.print(string.nicemath(nbClients), ScrW-148, 70)
	love.graphics.print("Clients : " , ScrW-220, 70)
	love.graphics.print("Popularité : "..tostring(Popularity).."/100", ScrW-220, 95)
	love.graphics.print("Taux directeur : "..tostring(mainRate), ScrW-220, 120)


end


function CreatePopUp(title,text, choices, fun1, fun2)
	local isinto = false
	hook.Add("OverLayDraw", "popup", function()
		pausetime()
		IsOnDesktop = false
		local MOUSE_X, MOUSE_Y = love.mouse.getPosition( )
		local hei = (string.Count(text, "\n")+1)*popuptext:getHeight()
		love.graphics.setColor(0,0,0,50)
		love.graphics.rectangle("fill", 0, 0, ScrW, ScrH )
		love.graphics.setColor(255,209,123)
		love.graphics.rectangle("fill", ScrW/2-260, ScrH/2-155-hei/2, 520, 200+6+hei )
		love.graphics.setColor(255,249,239)
		love.graphics.rectangle("fill", ScrW/2-257, ScrH/2-152-hei/2, 514, 200+hei )

		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", ScrW/2-207, ScrH/2-90-hei/2, 414, 1 )
		love.graphics.setFont(popuptitle)
		love.graphics.print( title ,  ScrW/2 - popuptitle:getWidth(title)/2 , ScrH/2-133-hei/2)
		love.graphics.setFont(popuptext)
		love.graphics.print( text ,  ScrW/2- 230 , ScrH/2-83-hei/2)

		if not choices then

			love.graphics.setFont(popuptitle)
			if MOUSE_X > ScrW/2-150 and MOUSE_X <  ScrW/2+150 and MOUSE_Y > ScrH/2-30+hei-hei/2 and MOUSE_Y < ScrH/2-30+hei+60-hei/2 then
				love.mouse.setCursor( c_hand )

				
				love.graphics.setColor(250,164,26)
				love.graphics.rectangle("fill", ScrW/2-150, ScrH/2-30+hei-hei/2, 300, 60 )
				love.graphics.setColor(0,0,0,250)
				love.graphics.print( "OK" ,  ScrW/2 - popuptitle:getWidth("OK")/2 , ScrH/2-30+hei+15-hei/2)
				if love.mouse.isDown("l") then
					unpausetime()
					hook.Remove("OverLayDraw", "popup")
					love.mouse.setCursor( c_arrow )
					IsOnDesktop = true
				end

			else
				love.mouse.setCursor( c_arrow )
				love.graphics.setColor(247,143,29)
				love.graphics.rectangle("fill", ScrW/2-150, ScrH/2-30+hei-hei/2, 300, 60 )
				love.graphics.setColor(0,0,0,250)
				love.graphics.print( "OK" ,  ScrW/2 - popuptitle:getWidth("OK")/2 , ScrH/2-30+hei+15-hei/2)

			end
		end
	end)
end

PopUPMoneyStack = 0

--[[
****No choice about this little glitch, putting the hook "MoneyChangeDraw" .. seed into the hook Show Money change
****will send the updates variables each time the hook Show Money change is ran to the old popups, so they will just move at the same place
--]]



local function creatething(seed, time, lPopUPMoneyStack, num,reason)
	print("called in")
	hook.Add("BackGroundDraw", "MoneyChangeDraw" .. seed, function()
		love.graphics.setFont( date_box_text1 )
		if time+0.5 > love.timer.getTime() then
			local factor = 255
			if time < love.timer.getTime() then 
				factor = 255-(math.abs(time - love.timer.getTime())*255*2)
			end

			love.graphics.setColor(255,253,246,factor)
			love.graphics.rectangle( "fill", ScrW-200, 100+80*lPopUPMoneyStack,170,75 )
			if num > 0 then 
				love.graphics.setColor(0,128,0,factor)
			else
				love.graphics.setColor(128,0,0,factor)
			end

				love.graphics.print(string.nicemath(num), ScrW-180, 105+80*lPopUPMoneyStack)
				love.graphics.setColor(0,0,0,factor)
				love.graphics.print(reason, ScrW-180, 130+80*lPopUPMoneyStack)

			
		else
			PopUPMoneyStack = PopUPMoneyStack -1
			hook.Remove("BackGroundDraw", "MoneyChangeDraw" .. seed)
		end
	end)


end

hook.Add("MoneyAdd", "Show Money change", function(num,reason)

	local time = love.timer.getTime() + 2
	PopUPMoneyStack = PopUPMoneyStack +1

	creatething(tostring(math.random(5000000)), time, PopUPMoneyStack, num,reason)-- todo : fix
end)

hook.Add("DateChange", "Show Month Money change", function(num,reason)

	--if table.Count(PassedEvents.Months) > 29 then table.remove(PassedEvents.Months, 1) end


	if PastMonthEvent.LastMonth and T_DAY == 1 and T_SEM == 1 then
		local value;
		local ch = Money - PastMonthEvent.LastMonth
		table.insert(PastMonthEvent.Months, 1, ch)
		local max = PastMonthEvent.Months[table.GetWinningKey(PastMonthEvent.Months)]
		local min = PastMonthEvent.Months[table.GetLoosingKey(PastMonthEvent.Months)]

		if math.abs(min) > max then max = math.abs(min) end
		if min > -1*math.abs(max) then min = -1 * math.abs(max) end

		if ch >= 0 then
			 value = math.Remap(ch, 0,  max, 0,50)
		end
		if ch <= 0 then
			 value = math.Remap(ch,0, math.abs(min), 0,50)
		end
		table.insert(PastMonthEvent.MonthsV, 1, value)

		for k, v in pairs(PastMonthEvent.MonthsV) do
			local value1;
			local max = PastMonthEvent.Months[table.GetWinningKey(PastMonthEvent.Months)]
			local min = PastMonthEvent.Months[table.GetLoosingKey(PastMonthEvent.Months)]
			if math.abs(min) > max then max = math.abs(min) end
			if min > -1*math.abs(max) then min = -1 * math.abs(max) end
			local ch1 = PastMonthEvent.Months[k]
			if ch1 >= 0 then
				 PastMonthEvent.MonthsV[k] = math.Remap(ch1, 0,  max, 0,50)
			end
			if ch1 <= 0 then
				 PastMonthEvent.MonthsV[k] = math.Remap(ch1,0, math.abs(min), 0,50)
			end


		end
		if table.Count(PastMonthEvent.Months) > 35 then 
			table.remove(PastMonthEvent.Months, #PastMonthEvent.Months )
			table.remove(PastMonthEvent.MonthsV, #PastMonthEvent.MonthsV )
		end
		PastMonthEvent.LastMonth = Money
	end

	if not PastMonthEvent.LastMonth and T_DAY == 1 and T_SEM == 1 then
		PastMonthEvent.LastMonth = Money
	end

end)

hook.Add("SaveRestored", "MoneyMonthDrawsave",function () 
	hook.Add("BackGroundDraw", "MoneyMonthDraw",function () 
		local value;
		love.graphics.setColor(255,255,255)
		surface.RoundedBox(30, 10, 210, 50, 5)
		love.graphics.setColor(0,0,0)
		love.graphics.setFont( date_box_text1 )
		love.graphics.print("Flux", 30+105-date_box_text1:getWidth("Flux")/2,17)
		surface.HUDStaticBox(10,45,250,120)
		love.graphics.setColor(0,0,0,255)
		love.graphics.rectangle("fill",10,45+60, 250,1)
		if table.Count(PastMonthEvent.Months) < 1 then return end
		local max = PastMonthEvent.Months[table.GetWinningKey(PastMonthEvent.Months)]
		local min = PastMonthEvent.Months[table.GetLoosingKey(PastMonthEvent.Months)]

		if math.abs(min) > max then max = math.abs(min) end
		if min > -1*math.abs(max) then min = -1 * math.abs(max) end

		for k, v in pairs(PastMonthEvent.Months) do
			local value = PastMonthEvent.MonthsV[k]
			if v > 0 then
				love.graphics.setColor(50,255,50,255)
				love.graphics.rectangle("fill",5+6*k,105-value, 5,value)
			else
				love.graphics.setColor(255,50,50,255)
				
				love.graphics.rectangle("fill",5+6*k,105,5,-1*value)
			end

		end

			love.graphics.setFont( fluwtext )
			love.graphics.setColor(0,0,0,factor)
			love.graphics.print(max .. "F", 14 , 45 )
			love.graphics.print(max .. "F", 14 , 155 )

	end)
end)