
local backgroundpic = love.graphics.newImage("ressources/maquette_v2.png")
local quad = love.graphics.newQuad(000, 000, 1280, 720, 1280,720)


hook.Add("BackBackGround", "The real one this time", function()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(backgroundpic,quad , 00, 00)
end)
