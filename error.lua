



ERROR_SENT = false


local quad = love.graphics.newQuad(000, 000, 600, 500, 250,205)
local debug, print = debug, print

local function error_printer(msg, layer)
    print((debug.traceback("Error: " .. tostring(msg), 1+(layer or 1)):gsub("\n[^\n]+$", "")))
end

function love.errhand(msg)
	error_printer(msg, 2)
		local trace = debug.traceback()
    local err = {}
  	if love.mouse then
		love.mouse.setVisible(true)
		love.mouse.setGrabbed(false)
	end

    table.insert(err, "Error\n")
    table.insert(err, msg.."\n\n")
    for l in string.gmatch(trace, "(.-)\n") do
        if not string.match(l, "error.lua") then
            l = string.gsub(l, "stack traceback:", "Traceback\n")
            table.insert(err, l)
        end
    end
    local p = table.concat(err, "\n")
    p = string.gsub(p, "\t", "")
    p = string.gsub(p, "%[string \"(.-)\"%]", "%1")


    ScrW, ScrH = love.window.getDimensions( )
    if love.audio then love.audio.stop() end
    love.graphics.reset()
    love.graphics.setBackgroundColor( 0,0,0 )
    errorsound:play()
    local function draw()
        love.mouse.setCursor( love.mouse.getSystemCursor('arrow') )
        love.graphics.clear()

        love.graphics.setFont(fonterrortitle)
        local text = "GG M8"
        love.graphics.print( text ,  ScrW/2 - fonterrortitle:getWidth(text)/2, 5)

        love.graphics.setFont(fonterrorsubtitle)
        local text = "You broke the game"
        love.graphics.print( text ,  ScrW/2 - fonterrorsubtitle:getWidth(text)/2, 85)
        love.graphics.setFont(sfonterrorsubtitle2)
        local text = "fucking"
        love.graphics.print( text ,  ScrW/2 - fonterrorsubtitle:getWidth("You broke the game")/2 + fonterrorsubtitle:getWidth("You broke the")-22 , 122)


        love.graphics.setColor(255,255,255,255)
        love.graphics.draw(warning,quad , 900, 180+math.sin(love.timer.getTime()*3)*12,math.rad(5))

        love.graphics.setFont(love.graphics.newFont (15))
        love.graphics.print(p, 42, 230)
		love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 700)
		love.graphics.print('Memory actually used (in kB): ' .. math.Round(collectgarbage('count')), 900,700)
        local hei = (string.Count(p, "\n")+1)*love.graphics.newFont (15):getHeight()
        love.graphics.print("The error has been sent to the master server and copied to your clipboard.\nFeel free to ask help on the officials forums. (Or to your cat)",42, hei+330)


        if not ERROR_SENT then
            ERROR_SENT = true
            love.system.setClipboardText( p )
            love.filesystem.write( tostring(os.time()) ..".txt", table.ToString(_G, "_G", true))
        end
        love.graphics.present()
    end
    while true do
        love.event.pump()
        for e, a, b, c in love.event.poll() do
            if e == "quit" then os.exit() end
            if e == "keypressed" and a == "escape" then os.exit() end
        end
        draw()
    end
end