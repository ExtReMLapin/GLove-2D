

width, height = love.graphics.getDimensions( )


function love.graphics.draw_graph(x, y, w, h, tbl, offset)
	local tmptbl = {}
	local max = tbl[table.GetWinningKey(tbl)]
	local min = tbl[table.GetLoosingKey(tbl)]
	local dy = 0
	local dx = 0
	local numkeys = #tbl

	for k, v in pairs(tbl) do
		i = (k-1)*2 + 1
		dx = math.Remap(k, 1, numkeys , x, w+x)
		dy = height - (height-(h+y))  -    (math.Remap(v, min, max, y, h+y)) + y
		tmptbl[i] = dx
		tmptbl[i+1] = dy

	end
	love.graphics.rectangle("line", x, y, w, h )
	--love.graphics.polygon("fill",tmptbl)
	love.graphics.line(tmptbl)
end