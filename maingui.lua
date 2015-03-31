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

	MenuLeft = loveframes.Create("image")
	MenuLeft:SetImage("ressources/UiRackInfos.png"):SetScale(0.58,0.37)
	MenuLeft:SetPos(ScrW-40, 250)
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


	tabsmenudown = loveframes.Create("tabs", MenuDown)
	tabsmenudown:SetPos(5, 2)
	tabsmenudown:SetSize(440, 500)
	local gr1 =love.graphics.newImage("ressources/UiJaugeBad.png")
	local gr2 =love.graphics.newImage("ressources/UiJaugeMedium.png")
	local gr3 =love.graphics.newImage("ressources/UiJaugeGood.png")


    local panel1 = loveframes.Create("panel")
    tabsmenudown:AddTab("Investisements", panel1, "Investisements")
    local panel11 =  loveframes.Create("panel", panel1)
        panel11.a = 100/3
	    panel11.b = 100/3
	    panel11:SetSize(375,40)
	    panel11:SetPos(30,30)
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


			slider1:SetPos(30, 90)
			slider1:SetWidth(370)
			slider1:SetMinMax(0, (100/3)*2)
			slider2:SetPos(30, 110)
			slider2:SetWidth(370)
			slider2:SetMinMax(0, 100)



			slider1:SetValue(100/3)
			slider1.OnValueChanged = function(object)
				panel11.a = object:GetValue()
				if (slider2:GetValue() + object:GetValue()) > 100 then
					slider2:SetValue(100-(panel11.a))
				end
			end
	


			slider2.OnValueChanged = function(object, dt)
				panel11.b = object:GetValue()
				object:SetMinMax(0, 100-(slider1:GetValue()))

			end



    local panel2 = loveframes.Create("panel")
    tabsmenudown:AddTab("Créditeurs", panel2, "Créditeurs")

    local panel3 = loveframes.Create("panel")
    tabsmenudown:AddTab("Achats/Ventes", panel3, "Achats/Ventes")

    local panel4 = loveframes.Create("panel")
    tabsmenudown:AddTab("Personel", panel4, "Personel")

    local panel5 = loveframes.Create("panel")
    tabsmenudown:AddTab("Publicité", panel5, "Publicité")



end)


















