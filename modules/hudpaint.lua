width, height = love.graphics.getDimensions( )

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


local fnt1 = love.graphics.newFont(  )
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
