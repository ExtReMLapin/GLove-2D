
local backgroundpic = love.graphics.newImage("ressources/level3.png")
local quad = love.graphics.newQuad(0, 0, 128, 64, backgroundpic:getWidth(), backgroundpic:getHeight())
local Width = backgroundpic:getWidth( )
print( Width)
CameraPos = {x = 0, y = 0}


hook.Add("BackBackGround", "The real one this time", function()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(backgroundpic, 0, 0 )
end)