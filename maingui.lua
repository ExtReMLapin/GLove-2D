require"modules/hook"

--[[username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500
local principalMenuX = 0
local principalMenuY = 0
RightClickMENU = false
IsOnDesktop = true
IsInRightClickMenu = false

function gamestate(realX, realY)
	return _gamestate or "default"
end


function principalMenu(realX, realY)
	if not IsOnDesktop then return end
	if not RightClickMENU1 then
		pausetime()
		RightClickMENU1 = loveframes.Create("panel")
		RightClickMENU1:SetPos(realX-50,realY-200)
		RightClickMENU1.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			IsInRightClickMenu = true
		end
		RightClickMENU1.OnMouseExit = function(object)
			love.mouse.setCursor( c_arrow )
			IsInRightClickMenu = false
		end
		RightClickMENU1.OnClick = function(object)
			investisseurMenu()
			love.mouse.setCursor( c_cursor )
			RightClickMENU1:Remove()
			RightClickMENU2:Remove()
			RightClickMENU3:Remove()
			RightClickMENU4:Remove()
			RightClickMENU1= nil
			RightClickMENU3= nil
			RightClickMENU2= nil
			RightClickMENU4= nil
		end

		    local text1 = loveframes.Create("text", RightClickMENU1)
			    text1:SetPos(7, 10)
			    text1:SetFont(subtitle)
			    text1:SetLinksEnabled(false)
			    text1:SetText("Investisseurs")
				text1.OnMouseEnter = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true

				end
				text1.OnMouseExit = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end
				text1.OnClick = function(object)
					investisseurMenu()
					love.mouse.setCursor( c_cursor )
							RightClickMENU1:Remove()
							RightClickMENU2:Remove()
							RightClickMENU3:Remove()
							RightClickMENU4:Remove()
							RightClickMENU1= nil
							RightClickMENU3= nil
							RightClickMENU2= nil
							RightClickMENU4= nil
				end
---------------------------------------------------------------------------------------
		RightClickMENU2 = loveframes.Create("panel")
		RightClickMENU2:SetPos(realX-50,realY-140)
		RightClickMENU2.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			IsInRightClickMenu = true
		end
		RightClickMENU2.OnMouseExit = function(object)
			love.mouse.setCursor( c_arrow )
			IsInRightClickMenu = false
		end



		RightClickMENU2.OnClick = function(object)
		crediteurMenu()
		love.mouse.setCursor( c_cursor )
					RightClickMENU1:Remove()
					RightClickMENU2:Remove()
					RightClickMENU3:Remove()
					RightClickMENU4:Remove()
					RightClickMENU1= nil
					RightClickMENU3= nil
					RightClickMENU2= nil
					RightClickMENU4= nil
				end

		    local text2 = loveframes.Create("text", RightClickMENU2)
			    text2:SetPos(7, 10)
			    text2:SetFont(subtitle)
			    text2:SetLinksEnabled(false)
			    text2:SetText("Créditeurs")
				text2.OnMouseEnter = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end
				text2.OnMouseExit = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end

					text2.OnClick = function(object)
					crediteurMenu()
					love.mouse.setCursor( c_cursor )
							RightClickMENU1:Remove()
							RightClickMENU2:Remove()
							RightClickMENU3:Remove()
							RightClickMENU4:Remove()
							RightClickMENU1= nil
							RightClickMENU3= nil
							RightClickMENU2= nil
							RightClickMENU4= nil
				end


---------------------------------------------------------------------------------------
		RightClickMENU3 = loveframes.Create("panel")
		RightClickMENU3:SetPos(realX-50,realY-80)
		RightClickMENU3.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			IsInRightClickMenu = true
		end
		RightClickMENU3.OnMouseExit = function(object)
			love.mouse.setCursor( c_arrow )
			IsInRightClickMenu = false
		end

		    local text3 = loveframes.Create("text", RightClickMENU3)
			    text3:SetPos(7, 10)
			    text3:SetFont(subtitle)
			    text3:SetLinksEnabled(false)
			    text3:SetText("Liste des Actions")
				text3.OnMouseEnter = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end
				text3.OnMouseExit = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end
---------------------------------------------------------------------------------------
		RightClickMENU4 = loveframes.Create("panel")
		RightClickMENU4:SetPos(realX-50,realY-260)
		RightClickMENU4.OnMouseEnter = function(object)
			love.mouse.setCursor( c_hand )
			IsInRightClickMenu = true
		end
		RightClickMENU4.OnMouseExit = function(object)
			love.mouse.setCursor( c_arrow )
			IsInRightClickMenu = false
		end

		RightClickMENU4.OnClick = function(object)
		budgetMenu()
		love.mouse.setCursor( c_cursor )
					RightClickMENU1:Remove()
					RightClickMENU2:Remove()
					RightClickMENU3:Remove()
					RightClickMENU4:Remove()
					RightClickMENU1= nil
					RightClickMENU3= nil
					RightClickMENU2= nil
					RightClickMENU4= nil
				end



			local text4 = loveframes.Create("text", RightClickMENU4)
				text4:SetPos(7, 10)
				text4:SetFont(subtitle)
				text4:SetLinksEnabled(false)
				text4:SetText("Budget")
				text4.OnMouseEnter = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end
				text4.OnMouseExit = function(object)
					love.mouse.setCursor( c_hand )
					IsInRightClickMenu = true
				end
				text4.OnClick = function(object)
					budgetMenu()
					love.mouse.setCursor( c_cursor )
							RightClickMENU1:Remove()
							RightClickMENU2:Remove()
							RightClickMENU3:Remove()
							RightClickMENU4:Remove()
							RightClickMENU1= nil
							RightClickMENU3= nil
							RightClickMENU2= nil
							RightClickMENU4= nil
				end


	else
		if IsInRightClickMenu then return end
			love.mouse.setCursor( c_cursor )
			RightClickMENU1:Remove()
			RightClickMENU2:Remove()
			RightClickMENU3:Remove()
			RightClickMENU4:Remove()
			RightClickMENU1= nil
			RightClickMENU3= nil
			RightClickMENU2= nil
			RightClickMENU4= nil
			unpausetime()
	end
end

function seformerMenu(realX,realY)
	menuFormer = loveframes.Create("image")
	menuFormer:SetImage("ressources/formerbar.png")
	menuFormer:SetPos(principalMenuX + 212,principalMenuY)
end
--]]

hook.Add("SaveRestored", "gui create", function()

	MenuLeft = loveframes.Create("panel")
	MenuLeft.DrawPic = love.graphics.newImage("ressources/UiRackInfos.png")
	MenuLeft:SetPos(ScrW-40, 250)
	MenuLeft:SetSize(500,300)
	MenuLeft.Draw = function ()
		love.graphics.setColor(255,255,255)
		local quad = love.graphics.newQuad(0,0, MenuLeft.DrawPic:getWidth( ), MenuLeft.DrawPic:getHeight( ),MenuLeft.DrawPic:getWidth( )*0.58,MenuLeft.DrawPic:getHeight( )*0.37)
		love.graphics.draw(MenuLeft.DrawPic,quad ,MenuLeft:GetX(), MenuLeft:GetY())
	end
	MenuLeft.Update = function(object, dt)
	local MOUSE_X, MOUSE_Y = love.mouse.getPosition( )
		if MOUSE_X > MenuLeft:GetX() and MOUSE_X < (MenuLeft:GetX() + MenuLeft:GetWidth()) and MOUSE_Y > MenuLeft:GetY() and MOUSE_Y < (MenuLeft:GetY() + MenuLeft:GetHeight()) then
			if MenuLeft:GetX() > ScrW - 350 then
			MenuLeft:SetPos(math.Approach( MenuLeft:GetX(), ScrW - 350, -25 ), MenuLeft:GetY())
			end
		else
			if MenuLeft:GetX() == ScrW-40 then return end
			if MenuLeft:GetX() < ScrW-40 then MenuLeft:SetPos(math.Approach( MenuLeft:GetX(), ScrW - 40, 25 ), MenuLeft:GetY()) end
			if MenuLeft:GetX() > ScrW-40 then MenuLeft:SetPos(math.Approach( MenuLeft:GetX(), ScrW - 40, -25 ), MenuLeft:GetY()) end

		end
	end




		local MenuDownArrow = loveframes.Create("image", MenuLeft)
		MenuDownArrow:SetImage("ressources/ArrowBrown.png")
		MenuDownArrow:SetPos(20, 145)
		MenuDownArrow:SetOffsetX(17/2)
		MenuDownArrow:SetOffsetY(10)
		MenuDownArrow.Update = function(object)
			MenuDownArrow:SetOrientation(math.rad(math.Remap(ScrW-MenuLeft:GetX(),350,40,0,180) )+math.rad(180))
		end



	MenuDown = loveframes.Create("panel")
	MenuDown:SetSize(450,600)
	MenuDown.DrawPic = love.graphics.newImage("ressources/UiBaseRackMenuf.png")
	MenuDown:SetPos(37, ScrH-25)
	MenuDown.Draw = function ()
		local quad = love.graphics.newQuad(0,0, MenuDown.DrawPic:getWidth( ), MenuDown.DrawPic:getHeight( ),450,600)
		love.graphics.draw(MenuDown.DrawPic,quad ,MenuDown:GetX(), MenuDown:GetY())
	end
	
	MenuDown.Update = function(object, dt)
	local MOUSE_X, MOUSE_Y = love.mouse.getPosition( )
		if MOUSE_X > MenuDown:GetX() and MOUSE_X < (MenuDown:GetX() + MenuDown:GetWidth()) and MOUSE_Y > MenuDown:GetY() and MOUSE_Y < (MenuDown:GetY() + MenuDown:GetHeight()) then                   
			if MenuDown:GetY() > ScrH - 550 then
			MenuDown:SetPos(MenuDown:GetX() ,  math.Approach( MenuDown:GetY(), ScrH - 550, -34 ))
			end
		else
			if MenuDown:GetY() == ScrH-25 then return end
			if MenuDown:GetY() < ScrH-25 then MenuDown:SetPos(MenuDown:GetX(),math.Approach( MenuDown:GetY(), ScrH - 25, 34 )) end
			if MenuDown:GetY() > ScrH-25 then MenuDown:SetPos(MenuDown:GetX(),math.Approach( MenuDown:GetY(), ScrH - 25, -34 )) end
		end

	end

		local MenuDownArrow = loveframes.Create("image", MenuDown)
		MenuDownArrow:SetImage("ressources/arrow2.png")
		MenuDownArrow:SetPos(400, 12)
		MenuDownArrow:SetOffsetX(9)
		MenuDownArrow:SetOffsetY(9)
		MenuDownArrow.Update = function(object)
			MenuDownArrow:SetOrientation(math.rad(math.Remap(ScrH-MenuDown:GetY(),550,25,0,180) ) + math.rad(90))
		end

	tabsmenudown = loveframes.Create("tabs", MenuDown)
	tabsmenudown:SetPos(5, 25)
	tabsmenudown:SetSize(440, 500)
	local gr1 =love.graphics.newImage("ressources/UiJaugeBad.png")
	local gr2 =love.graphics.newImage("ressources/UiJaugeMedium.png")
	local gr3 =love.graphics.newImage("ressources/UiJaugeGood.png")
	local buttonpic = love.graphics.newImage("ressources/UiJaugeArrow.png")


    local panel1 = loveframes.Create("panel")
    tabsmenudown:AddTab("Investisements", panel1, "Investisements")


    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------
    if not containerInvestissement then
	    local containerInvestissement = loveframes.Create("image", panel1)
	    containerInvestissement:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(10)
	    local titleContainerInvestissement = loveframes.Create("text", panel1)
	    titleContainerInvestissement:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Points par Durée (Années)"):Center():SetY(14)
	end

    local panel11 =  loveframes.Create("panel", panel1)
        panel11.a = 100/3
	    panel11.b = 100/3
	    panel11:SetSize(375,40)
	    panel11:SetPos(30,80)
	    panel11.Draw = function()
	    	love.graphics.setColor(255,255,255)
	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel11.a,0,100,0,375),40, 3, 54)
			love.graphics.draw(gr1,quad ,panel11:GetX(), panel11:GetY())

	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel11.b,0,100,0,375),40, 3, 54)
			love.graphics.draw(gr2,quad ,panel11:GetX()+math.Remap(panel11.a,0,100,0,375), panel11:GetY())

			local quad = love.graphics.newQuad(0,0,math.Remap(100-panel11.b-panel11.a,0,100,0,375),40, 3, 54)
			love.graphics.draw(gr3,quad ,panel11:GetX()+math.Remap(panel11.a,0,100,0,375)+math.Remap(panel11.b,0,100,0,375), panel11:GetY())
	    end


	    	

	   local slider1 = loveframes.Create("slider", panel1)
	   local slider2 = loveframes.Create("slider", panel1)
		slider1:SetPos(30, 140)
		slider1:SetWidth(370)
		slider1:SetMinMax(0, (100/3)*2)
		slider2:SetPos(30, 160)
		slider2:SetWidth(370)
		slider2:SetMinMax(0, 100)

		slider1:SetValue(100/3)
		slider1.OnValueChanged = function(object)
		--print(math.Remap(panel11.a,0,100,0,375))
			panel11.a = object:GetValue()
			if (slider2:GetValue() + object:GetValue()) > 100 then
				slider2:SetValue(100-(panel11.a))
			end
			object:SetMinMax(0,100-panel11.b)
		end
	


		slider2.OnValueChanged = function(object, dt)
			panel11.b = object:GetValue()
			object:SetMinMax(0, 100-(slider1:GetValue()))
		end


-------------------------------------------------------------------------

		local button1 = loveframes.Create("button", panel1)
		button1:SetWidth(20)
		button1:SetHeight(20)
		button1:SetPos(30+panel11:GetX()+math.Remap(panel11.a,0,100,0,375)-10, 54)
		button1.Draw= function(object)
			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
			love.graphics.draw(buttonpic,quad,object:GetX() ,object:GetY())
			love.graphics.setFont(fluwtexttuto)
			love.graphics.print(math.Round(panel11.a), object:GetX()+4,object:GetY()+3)
		end

		button1.OnMouseReleased = function()
			hook.Remove("Think", "button follow mouse")
		end
	


-------------------------------------------------------------------------

		local button2 = loveframes.Create("button", panel1)
		button2:SetWidth(20)
		button2:SetHeight(20)
		button2:SetPos(30+panel11:GetX()+math.Remap(panel11.a,0,100,0,375)+math.Remap(panel11.b,0,100,0,375)-10, 124)
		button2.Draw= function(object)
			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
			love.graphics.draw(buttonpic,quad,object:GetX()+21 ,object:GetY()+23,math.rad(180))
			love.graphics.setFont(fluwtexttuto)
			love.graphics.print(math.Round(panel11.b + panel11.a), object:GetX()+4,object:GetY()+5)
		end

		button2.OnMouseReleased = function()
			hook.Remove("Think", "button follow mouse2")
		end
	

		button2.OnMousePressed = function() 
			if not button2.down then return end
			hook.Add("Think", "button follow mouse2", function()
				
				local min = 57+20
				local max = 57+20+375
				if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
					button2:SetX(math.Max(math.Min(love.mouse.getX()-57, 405-10),77+math.Remap(panel11.a,0,100,0,375)-50))
					slider2:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100)-panel11.a)

				end
			end )
		end




		button1.OnMousePressed = function() 
		if not button1.down then return end
			hook.Add("Think", "button follow mouse", function()
				
				local min = 57+20
				local max = 57+20+375
				if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
					button1:SetX(math.Min(love.mouse.getX()-57, 405-math.Remap(panel11.b,0,100,0,375)-10))
					slider1:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100))
					button2:SetX(math.Remap(panel11.b+ panel11.a,0,100,0,375)+20)
				end
			end )
		end

		--------------------------------------------------------------------------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------
		if not containerInvestissement2 then
			local containerInvestissement2 = loveframes.Create("image", panel1)
	    	containerInvestissement2:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(210)
	   		local titleContainerInvestissement2 = loveframes.Create("text", panel1)
	    	titleContainerInvestissement2:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Points par Montant (Millions)"):Center():SetY(214)
	 	end

		local panel12 =  loveframes.Create("panel", panel1)
        panel12.a = 100/3
	    panel12.b = 100/3
	    panel12:SetSize(375,40)
	    panel12:SetPos(30,280)
	    panel12.Draw = function()
	    	love.graphics.setColor(255,255,255)
	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel12.a,0,100,0,375),40, 3, 54)
			love.graphics.draw(gr1,quad ,panel12:GetX(), panel12:GetY())

	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel12.b,0,100,0,375),40, 3, 54)
			love.graphics.draw(gr2,quad ,panel12:GetX()+math.Remap(panel12.a,0,100,0,375), panel12:GetY())

			local quad = love.graphics.newQuad(0,0,math.Remap(100-panel12.b-panel12.a,0,100,0,375),40, 3, 54)
			love.graphics.draw(gr3,quad ,panel12:GetX()+math.Remap(panel12.a,0,100,0,375)+math.Remap(panel12.b,0,100,0,375), panel12:GetY())
	    end


	    	

	   local slider3 = loveframes.Create("slider", panel1)
	   local slider4 = loveframes.Create("slider", panel1)
		slider3:SetPos(30, 340)
		slider3:SetWidth(370)
		slider3:SetMinMax(0, (100/3)*2)
		slider4:SetPos(30, 360)
		slider4:SetWidth(370)
		slider4:SetMinMax(0, 100)

		slider3:SetValue(100/3)
		slider3.OnValueChanged = function(object)
		--print(math.Remap(panel12.a,0,100,0,375))
			panel12.a = object:GetValue()
			if (slider4:GetValue() + object:GetValue()) > 100 then
				slider4:SetValue(100-(panel12.a))
			end
			object:SetMinMax(0,100-panel12.b)
		end
	


		slider4.OnValueChanged = function(object, dt)
			panel12.b = object:GetValue()
			object:SetMinMax(0, 100-(slider3:GetValue()))
		end


-------------------------------------------------------------------------

		local button3 = loveframes.Create("button", panel1)
		button3:SetWidth(20)
		button3:SetHeight(20)
		button3:SetPos(30+panel12:GetX()+math.Remap(panel12.a,0,100,0,375)-10, 254)
		button3.Draw= function(object)
			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
			love.graphics.draw(buttonpic,quad,object:GetX() ,object:GetY())
			love.graphics.setFont(fluwtexttuto)
			love.graphics.print(math.Round(panel12.a), object:GetX()+4,object:GetY()+3)
		end

		button3.OnMouseReleased = function()
			hook.Remove("Think", "button follow mouse")
		end
	


-------------------------------------------------------------------------

		local button4 = loveframes.Create("button", panel1)
		button4:SetWidth(20)
		button4:SetHeight(20)
		button4:SetPos(30+panel12:GetX()+math.Remap(panel12.a,0,100,0,375)+math.Remap(panel12.b,0,100,0,375)-10, 324)
		button4.Draw= function(object)
			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
			love.graphics.draw(buttonpic,quad,object:GetX()+21 ,object:GetY()+23,math.rad(180))
			love.graphics.setFont(fluwtexttuto)
			love.graphics.print(math.Round(panel12.b + panel12.a), object:GetX()+4,object:GetY()+5)
		end

		button4.OnMouseReleased = function()
			hook.Remove("Think", "button follow mouse2")
		end
	

		button4.OnMousePressed = function() 
			if not button4.down then return end
			hook.Add("Think", "button follow mouse2", function()
				
				local min = 57+20
				local max = 57+20+375
				if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
					button4:SetX(math.Max(math.Min(love.mouse.getX()-57, 405-10),77+math.Remap(panel12.a,0,100,0,375)-50))
					slider4:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100)-panel12.a)

				end
			end )
		end




		button3.OnMousePressed = function() 
		if not button3.down then return end
			hook.Add("Think", "button follow mouse", function()
				
				local min = 57+20
				local max = 57+20+375
				if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
					button3:SetX(math.Min(love.mouse.getX()-57, 405-math.Remap(panel12.b,0,100,0,375)-10))
					slider3:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100))
					button4:SetX(math.Remap(panel12.b+ panel12.a,0,100,0,375)+20)
				end
			end )
		end

		--------------------------------------------------------------------------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------

    local panel2 = loveframes.Create("panel")
    tabsmenudown:AddTab("Créditeurs", panel2, "Créditeurs")

    local panel3 = loveframes.Create("panel")
    tabsmenudown:AddTab("Achats/Ventes", panel3, "Achats/Ventes")

    local panel4 = loveframes.Create("panel")
    tabsmenudown:AddTab("Personel", panel4, "Personel")

    local panel5 = loveframes.Create("panel")
    tabsmenudown:AddTab("Publicité", panel5, "Publicité")



end)
