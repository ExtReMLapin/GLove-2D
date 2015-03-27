ScrW_RATIO = 1
ScrH_RATIO = 1



local backgroundpic = love.graphics.newImage("ressources/Background.png")
local secretaryPic = love.graphics.newImage("ressources/CharaSecretaryAnim1.png")
hook.Add("BackBackGround", "The real one this time", function()
	love.graphics.setColor(255,255,255,255)
	local midx = ScrW/2
	local midy = ScrH/2
	x = ScrW
	y = ScrH
	if ScrW/ScrH < backgroundpic:getWidth( )/backgroundpic:getHeight( ) then -- plus haut que large
		y = ScrW / (backgroundpic:getWidth( )/backgroundpic:getHeight( ))
		ScrH_RATIO = y/ScrH
	end

	if ScrW/ScrH > backgroundpic:getWidth( )/backgroundpic:getHeight( ) then -- plus large que haut (kom ta mer lol)
		x = ScrH * (backgroundpic:getWidth( )/backgroundpic:getHeight( ))
		ScrW_RATIO = x/ScrW
	end

	local quad = love.graphics.newQuad(0,0, backgroundpic:getWidth( ), backgroundpic:getHeight( ),x,y)
	love.graphics.draw(backgroundpic,quad ,midx - x/2, midy - y/2)


	local quad = love.graphics.newQuad(0,0, secretaryPic:getWidth( ), secretaryPic:getHeight( ),x*263/1280,y*215/720)
	love.graphics.draw(secretaryPic,quad ,midx - x*150/1280, midy - y*200/720)
end)



