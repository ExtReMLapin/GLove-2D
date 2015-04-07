ScrW_RATIO = 1
ScrH_RATIO = 1


local backgroundpic = love.graphics.newImage("ressources/Background.png")
local secretaryPic = love.graphics.newImage("ressources/CharaSecretaryAnim1.png")
local comptoirPic = love.graphics.newImage("ressources/ObjectCounter.png")
local casierPic = love.graphics.newImage("ressources/casier.png")
local bossPic = love.graphics.newImage("ressources/CharaBankBoss.png")
local secu2Pic = love.graphics.newImage("ressources/CharaGuardians2.png")
local secu3Pic = love.graphics.newImage("ressources/CharaGuardians3.png")

local customers = {
	love.graphics.newImage("ressources/CharaCustomer1Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer2Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer3Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer4Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer3Anim1.png")
}


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


	local quad = love.graphics.newQuad(0,0 ,x*263/1280,y*215/720,x*263/1280,y*215/720)
	love.graphics.draw(secretaryPic,quad ,midx - x*150/1280, midy - y*200/720)

	local quad = love.graphics.newQuad(0,0, x*532/1280,y*394/720,x*532/1280,y*394/720)
	love.graphics.draw(comptoirPic,quad ,midx - x*210/1280, midy - y*140/720)


	--love.graphics.draw_nicegraph(midx-x*115/1280,  y*21/720, x*240/1280, y*118/720, bank.corpo_get_value_date("AMD"))


	local quad = love.graphics.newQuad(0,0, casierPic:getWidth( ), casierPic:getHeight( ),x*47.5/1280,y*115/720)
	love.graphics.draw(casierPic,quad ,midx - x*153/1280, midy- y*285/720)


	for k, v in pairs(customers) do

		local quad = love.graphics.newQuad(0,0, v:getWidth( ), v:getHeight( ),x*111/1280,y*134/720)
		love.graphics.draw(v,quad ,
		midx + x*(-180+k*95-k*k*3.5)/1280,
		midy + y*(150-k*48)/720)


	end

	local quad = love.graphics.newQuad(0,0, bossPic:getWidth( ), bossPic:getHeight( ),x*111.5/1280,y*139.375/720)
	love.graphics.draw(bossPic,quad ,midx - x*220/1280, midy- y*70/720)

	local quad = love.graphics.newQuad(0,0, secu2Pic:getWidth( ), secu2Pic:getHeight( ),x*111.5/1280,y*145/720)
	love.graphics.draw(secu2Pic,quad ,midx - x*350/1280, midy- y*120/720)

		local quad = love.graphics.newQuad(0,0, secu3Pic:getWidth( ), secu3Pic:getHeight( ),x*111.5/1280,y*145/720)
	love.graphics.draw(secu3Pic,quad ,midx - x*(350-135)/1280, midy- y*(120+69)/720)

end)



