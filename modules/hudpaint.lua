

width, height = love.graphics.getDimensions( )


function love.graphics.draw_graph(x, y, w, h, tbl, offset)
	local tmptbl = {}
	offset = offset or 0
	local max = table.GetWinningKey(tbl)
	local min = table.GetLoosingKey(tbl)

	local numkeys = #tbl

	for k, v in pairs(tbl) do
		i = (k-1)*2 + 1
		dx = (math.Map(k, 1, numkeys , 0, w) + x)
		dy = height - (math.Map(v, 0, max-min, 0 + offset, h-offset)+y)
		tmptbl[i] = dx
		tmptbl[i+1] = dy

	end
	love.graphics.rectangle("line", x, y, x+w, y+h )
	love.graphics.line(tmptbl)

end