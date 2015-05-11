ScrW_RATIO = 1
ScrH_RATIO = 1

local blurrywall = love.graphics.newImage("ressources/wallpoop.png")
local backgroundpic = love.graphics.newImage("ressources/BackgroundMedium.png")
local backgroundpic2 = love.graphics.newImage("ressources/BackgroundOver.png")
local secretaryPic = love.graphics.newImage("ressources/CharaSecretaryAnim1.png")
local comptoirPic = love.graphics.newImage("ressources/ObjectCounter.png")
--local casierPic = love.graphics.newImage("ressources/casier.png")
local bossPic = love.graphics.newImage("ressources/CharaBankBoss.png")
local secu2Pic = love.graphics.newImage("ressources/CharaGuardians2.png")
local secu3Pic = love.graphics.newImage("ressources/CharaGuardians3.png")
local Rcustomers;


local customers = {
	love.graphics.newImage("ressources/CharaCustomer1Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer2Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer3Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer4Anim1.png"),
	love.graphics.newImage("ressources/CharaCustomer5BackAnim1.png"),
	love.graphics.newImage("ressources/CharaCustomer6BackAnim1.png"),
	love.graphics.newImage("ressources/CharaCustomer7BackAnim1.png")

}

Rcustomers = {}
Rcustomers[1] = customers[1]
Rcustomers[2] = customers[2]
Rcustomers[3] = customers[3]
Rcustomers[4] = customers[4]
Rcustomers[5] = customers[5]
local ralpha = {255,255,255,255}


local emps = {
	
	love.graphics.newImage("ressources/CharaSalarymen1Stand.png"),
	love.graphics.newImage("ressources/CharaSalarymen2Stand.png"),
	love.graphics.newImage("ressources/CharaSalarymen3Stand.png"),
	love.graphics.newImage("ressources/CharaSalarymen4Stand.png"),
	love.graphics.newImage("ressources/CharaSalarymen5Stand.png")
}



local function remplace_custommer(id)
	local time = love.timer.getTime()
	local future = table.Random(customers)
	hook.Add("Think", "timer fast custommer draw alpha1", function() -- baisser texture
		if ralpha[id] == 0 then 
			hook.Remove("Think", "timer fast custommer draw alpha1")
			local time2 = love.timer.getTime()
			hook.Add("Think", "timer fast custommer draw alpha2", function()
				Rcustomers[id] = future
				if ralpha[id] == 255 then hook.Remove("Think", "timer fast custommer draw alpha2") end
				ralpha[id] = math.Min(255,(love.timer.getTime() - time2)*255)
				print(ralpha[id])
			end)
		end
		ralpha[id] = math.Max(0,255-((love.timer.getTime() - time)*255))
		
	end)


end


local VAR = 0
--[[
local frame = loveframes.Create("frame")
frame:SetName("Slider")
frame:SetSize(300, 275)


local button = loveframes.Create("button", frame)
button:SetWidth(200)
button:SetText("Button")
button:SetPos(0,0)
button.OnClick = function(object, x, y)
    remplace_custommer(4)
end




local slider2 = loveframes.Create("slider", frame)
slider2:SetPos(5, 60)
slider2:SetHeight(200)
slider2:SetMinMax(-600, 600)
slider2:SetButtonSize(20, 10)
slider2:SetSlideType("vertical")
slider2.OnValueChanged = function(object)
    VAR = object:GetValue()
    print(VAR)
end ]]



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





	local quad = love.graphics.newQuad(0,0, x,y,x,y)
	love.graphics.draw(backgroundpic,quad ,midx - x/2, midy - y/2)




	local quad = love.graphics.newQuad(0,0 ,x*210/1280,y*162/720,x*210/1280,y*162/720)
	love.graphics.draw(secretaryPic,quad ,midx - x*150/1280, midy - y*200/720)



	for k, v in pairs(emps) do
		local xxx = x*50/1280
		local yyy = y*75/720
		local quad = love.graphics.newQuad(0,0, xxx,yyy,xxx,yyy)
		love.graphics.draw(v,quad ,
		midx + x*(-170+k*75-k*k*3.5)/1280,
		midy + y*(-12-k*31)/720)
	end

	local quad = love.graphics.newQuad(0,0, x*425/1280,y*305/720,x*425/1280,y*305/720)
	love.graphics.draw(comptoirPic,quad ,midx - x*180/1280, midy - y*183/720)


	--love.graphics.draw_nicegraph(midx-x*115/1280,  midy-y*(220+118)/720, x*240/1280, y*118/720, bank.corpo_get_value_date("AMD"))


	--local quad = love.graphics.newQuad(0,0, casierPic:getWidth( ), casierPic:getHeight( ),x*47.5/1280,y*115/720)
	--love.graphics.draw(casierPic,quad ,midx - x*153/1280, midy- y*285/720)


	for k, v in pairs(Rcustomers) do
		love.graphics.setColor( 255,255,255,ralpha[k])
		local quad = love.graphics.newQuad(0,0,x*93/1280,y*103/720,x*93/1280,y*103/720)
		love.graphics.draw(v,quad ,
		midx + x*(-151+k*75-k*k*3.5)/1280,
		midy + y*(29-k*31)/720)
	end
	love.graphics.setColor( 255,255,255,255 )
	local quad = love.graphics.newQuad(0,0, bossPic:getWidth( ), bossPic:getHeight( ),x*89.2/1280,y*111.2/720)
	love.graphics.draw(bossPic,quad ,midx - x*220/1280, midy- y*70/720)

	local quad = love.graphics.newQuad(0,0, secu2Pic:getWidth( ), secu2Pic:getHeight( ),x*89.2/1280,y*116/720)
	love.graphics.draw(secu2Pic,quad ,midx - x*(250)/1280, midy- y*(151)/720)

	local quad = love.graphics.newQuad(0,0, secu3Pic:getWidth( ), secu3Pic:getHeight( ),x*89.2/1280,y*116/720)
	love.graphics.draw(secu3Pic,quad ,midx - x*(180)/1280, midy- y*(120+69)/720)



		local quad = love.graphics.newQuad(0,0, backgroundpic:getWidth( )-1, backgroundpic:getHeight( ),x,y)
	love.graphics.draw(backgroundpic2,quad ,midx - x/2, midy - y/2)
end)



