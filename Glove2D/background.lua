ScrW_RATIO = 1
ScrH_RATIO = 1

local blurrywall = love.graphics.newImage("ressources/wallpoop.png")
local backgroundpic = love.graphics.newImage("ressources/BackgroundMedium.png")
local secretaryPic = love.graphics.newImage("ressources/CharaSecretaryAnim1.png")
local comptoirPic = love.graphics.newImage("ressources/ObjectCounter.png")
--local casierPic = love.graphics.newImage("ressources/casier.png")
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





	--local quad = love.graphics.newQuad(0, 0, blurrywall:getWidth( ), blurrywall:getHeight( ), blurrywall:getWidth( ), blurrywall:getHeight( ))
local quad = love.graphics.newQuad(0, 0, blurrywall:getWidth( ), blurrywall:getHeight( ), blurrywall:getWidth( ), blurrywall:getHeight( ))
	love.graphics.draw(blurrywall,quad ,ScrW/2-blurrywall:getWidth( )/2 ,ScrH/2-blurrywall:getHeight( )/2)





	local quad = love.graphics.newQuad(0,0, backgroundpic:getWidth( )-1, backgroundpic:getHeight( ),x,y)
	love.graphics.draw(backgroundpic,quad ,midx - x/2, midy - y/2)




	local quad = love.graphics.newQuad(0,0 ,x*210/1280,y*162/720,x*210/1280,y*162/720)
	love.graphics.draw(secretaryPic,quad ,midx - x*150/1280, midy - y*200/720)

	local quad = love.graphics.newQuad(0,0, x*425/1280,y*305/720,x*425/1280,y*305/720)
	love.graphics.draw(comptoirPic,quad ,midx - x*180/1280, midy - y*183/720)


	--love.graphics.draw_nicegraph(midx-x*115/1280,  midy-y*(220+118)/720, x*240/1280, y*118/720, bank.corpo_get_value_date("AMD"))


	--local quad = love.graphics.newQuad(0,0, casierPic:getWidth( ), casierPic:getHeight( ),x*47.5/1280,y*115/720)
	--love.graphics.draw(casierPic,quad ,midx - x*153/1280, midy- y*285/720)


	for k, v in pairs(customers) do

		local quad = love.graphics.newQuad(0,0, v:getWidth( ), v:getHeight( ),x*93/1280,y*103/720)
		love.graphics.draw(v,quad ,
		midx + x*(-151+k*75-k*k*3.5)/1280,
		midy + y*(29-k*31)/720)


	end

	local quad = love.graphics.newQuad(0,0, bossPic:getWidth( ), bossPic:getHeight( ),x*111.5/1280,y*139.375/720)
	love.graphics.draw(bossPic,quad ,midx - x*220/1280, midy- y*70/720)

	local quad = love.graphics.newQuad(0,0, secu2Pic:getWidth( ), secu2Pic:getHeight( ),x*111.5/1280,y*145/720)
	love.graphics.draw(secu2Pic,quad ,midx - x*(350+10)/1280, midy- y*(120-10)/720)

	local quad = love.graphics.newQuad(0,0, secu3Pic:getWidth( ), secu3Pic:getHeight( ),x*111.5/1280,y*145/720)
	love.graphics.draw(secu3Pic,quad ,midx - x*(350-135)/1280, midy- y*(120+69)/720)
end)



