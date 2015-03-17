
local backgroundpic = love.graphics.newImage("ressources/maquette_v2.png")

hook.Add("BackBackGround", "The real one this time", function()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(backgroundpic, love.graphics.newQuad(000, 000, 1280, 720, 1280,720), 00, 00)
end)