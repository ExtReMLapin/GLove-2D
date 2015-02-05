

width, height = love.graphics.getDimensions( )


function love.graphics.draw_graph(x, y, w, h, tbl)
	love.graphics.setColor(98,203,235)
	local tmptbl = {}
	local max = tbl[table.GetWinningKey(tbl)]
	local min = tbl[table.GetLoosingKey(tbl)]
	local dy = 0
	local dx = 0
	local numkeys = #tbl

	for k, v in pairs(tbl) do
		i = (k-1)*2 + 1
		dx = math.Remap(k, 1, numkeys , x, w+x)
		dy = height - (height-(h+y)) - (math.Remap(v, min, max, y, h+y)) + y
		tmptbl[i] = dx
		tmptbl[i+1] = dy
	end
	love.graphics.rectangle("line", x, y, w, h )
	--love.graphics.polygon("fill",tmptbl)
	love.graphics.line(tmptbl)
end

function gesposongraph(x, y, w, h)
	xpos, ypos = love.mouse.getPosition( )
	return math.Remap(xpos,x, x+w, 0, 1)
end

local fnt1 = love.graphics.newFont(  )
local fnt2 = love.graphics.newFont(10)

function love.graphics.draw_nicegraph(x, y, w, h, tbl)

	love.graphics.setFont(graphfont)
	love.graphics.setColor(255,255,255)
	local codename = tbl.Elements[1].Symbol
	local realname = bank.corpo_get(codename).Name
	local max = tbl.Elements[1].DataSeries.close.values[table.GetWinningKey(tbl.Elements[1].DataSeries.close.values)]
	local min = tbl.Elements[1].DataSeries.close.values[table.GetLoosingKey(tbl.Elements[1].DataSeries.close.values)]
	local dolla = tbl.Elements[1].DataSeries.close.values[table.CloseValue(tbl.Positions, gesposongraph(x, y, w, h))]
	local date = tbl.Dates[table.CloseValue(tbl.Positions, gesposongraph(x, y, w, h))]
	xpos, ypos = love.mouse.getPosition( )
	love.graphics.draw_graph(x, y, w, h, tbl.Elements[1].DataSeries.close.values)
	if (xpos > x and xpos < x+w ) and (ypos > y and ypos < y+h ) then
		love.graphics.line(xpos, y, xpos, y+h)
		--love.graphics.line(x,ypos, x+w, ypos)
		love.graphics.print("Value : ".. dolla .. " " .. tbl.Elements[1].Currency, xpos +20, ypos +10)
		love.graphics.print(date, xpos +20, ypos +25)
		love.graphics.print(date, xpos +20, ypos +25)
	end

	local l = fnt1:getWidth("Brand Name : " .. realname) +11
	love.graphics.rectangle("line", x+w-l, y+h, l, 35 )
	love.graphics.print("UID : " .. codename,x+w-l+4, y+h+3 )
	
	
	if h < 100 then return end
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
