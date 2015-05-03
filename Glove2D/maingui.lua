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
			MenuLeft:SetPos(math.Approach( MenuLeft:GetX(), ScrW - 350, -1*math.Remap(25,0,love.timer.getFPS( ),0,60 ) ), MenuLeft:GetY())
			end
		else
			if MenuLeft:GetX() == ScrW-40 then return end
			if MenuLeft:GetX() < ScrW-40 then MenuLeft:SetPos(math.Approach( MenuLeft:GetX(), ScrW - 40, 1*math.Remap(25,0,love.timer.getFPS( ),0,60 ) ), MenuLeft:GetY()) end
			if MenuLeft:GetX() > ScrW-40 then MenuLeft:SetPos(math.Approach( MenuLeft:GetX(), ScrW - 40, -1*math.Remap(25,0,love.timer.getFPS( ),0,60 ) ), MenuLeft:GetY()) end

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


------------------------------------


	MenuDown = loveframes.Create("panel")
	MenuDown:SetSize(450,700)
	MenuDown.DrawPic = love.graphics.newImage("ressources/UiBaseRackMenuf.png")
	MenuDown:SetPos(37, ScrH-25)
	MenuDown.Draw = function ()
		local quad = love.graphics.newQuad(0,0,MenuDown:GetWidth( ),MenuDown:GetHeight( ), MenuDown.DrawPic:getWidth( ), MenuDown.DrawPic:getHeight( ))
		love.graphics.draw(MenuDown.DrawPic,quad ,MenuDown:GetX(), MenuDown:GetY())
	end
	
	MenuDown.Update = function(object, dt)
	local MOUSE_X, MOUSE_Y = love.mouse.getPosition( )
		if MOUSE_X > MenuDown:GetX() and MOUSE_X < (MenuDown:GetX() + MenuDown:GetWidth()) and MOUSE_Y > MenuDown:GetY() and MOUSE_Y < (MenuDown:GetY() + MenuDown:GetHeight()) then                   
			if MenuDown:GetY() > ScrH - (MenuDown:GetHeight()-50) then
			MenuDown:SetPos(MenuDown:GetX() ,  math.Approach( MenuDown:GetY(), ScrH - (MenuDown:GetHeight()-50), -1*math.Remap(50,0,love.timer.getFPS( ),0,60 )))
			end
		else
			if MenuDown:GetY() == ScrH-25 then return end
			if MenuDown:GetY() < ScrH-25 then MenuDown:SetPos(MenuDown:GetX(),math.Approach( MenuDown:GetY(), ScrH - 25, math.Remap(50,0,love.timer.getFPS( ),0,60 ) )) end
			if MenuDown:GetY() > ScrH-25 then MenuDown:SetPos(MenuDown:GetX(),math.Approach( MenuDown:GetY(), ScrH - 25, -1*math.Remap(50,0,love.timer.getFPS( ),0,60 ) )) end
		end

	end 

		local MenuDownArrow = loveframes.Create("image", MenuDown)
		MenuDownArrow:SetImage("ressources/arrow2.png")
		MenuDownArrow:SetPos(400, 12)
		MenuDownArrow:SetOffsetX(9)
		MenuDownArrow:SetOffsetY(9)
		MenuDownArrow.Update = function(object)
			MenuDownArrow:SetOrientation(math.rad(math.Remap(ScrH-MenuDown:GetY(),(MenuDown:GetHeight()-50),25,0,180) ) + math.rad(90))
		end

	tabsmenudown = loveframes.Create("tabs", MenuDown)
	tabsmenudown:SetPos(5, 25)
	tabsmenudown:SetSize(440, (MenuDown:GetHeight()-80))
	local gr1 =love.graphics.newImage("ressources/UiJaugeBad.png")
	local gr2 =love.graphics.newImage("ressources/UiJaugeMedium.png")
	local gr3 =love.graphics.newImage("ressources/UiJaugeGood.png")
	local buttonpic = love.graphics.newImage("ressources/UiJaugeArrow.png")


    local panel1 = loveframes.Create("panel")
    tabsmenudown:AddTab("Investisements", panel1, "Investisements")


    --------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------[[MULTI-SLIDER N°1]]----------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------

    if not containerInvestissement then
	    local containerInvestissement = loveframes.Create("image", panel1)
	    containerInvestissement:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(10)
	    local titleContainerInvestissement = loveframes.Create("text", panel1)
	    titleContainerInvestissement:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Points par Durée (Mois)"):Center():SetY(14)
	end




    local panel11 =  loveframes.Create("panel", panel1)
        panel11.a = 100/3
	    panel11.b = 100/3
	    panel11:SetSize(375,40)
	    panel11:SetPos(30,80)
	    panel11.Draw = function()
	    	love.graphics.setFont(sliderbarfont)
	    	love.graphics.setColor(255,255,255)
	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel11.a,0,100,0,375),30, 3, 54)
			love.graphics.draw(gr1,quad ,panel11:GetX(), panel11:GetY())
			

			local str = tostring(math.Round(panel11.a,1)) .. "%"
			love.graphics.print(str, panel11:GetX()+math.Max(0,math.Remap(panel11.a,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel11:GetY()+4)

			love.graphics.setColor(255,255,255)
	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel11.b,0,100,0,375),30, 3, 54)
			love.graphics.draw(gr2,quad ,panel11:GetX()+math.Remap(panel11.a,0,100,0,375), panel11:GetY())

			love.graphics.setColor(0,0,0)
			local str =tostring(math.Round(panel11.b,1)) .. "%"
			love.graphics.print(str, panel11:GetX()+math.Remap(panel11.a,0,100,0,375)+math.Max(0,math.Remap(panel11.b,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel11:GetY()+4)

			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,math.Remap(100-panel11.b-panel11.a,0,100,0,375),30, 3, 54)
			love.graphics.draw(gr3,quad ,panel11:GetX()+math.Remap(panel11.a,0,100,0,375)+math.Remap(panel11.b,0,100,0,375), panel11:GetY())

			love.graphics.setColor(0,0,0)
			local str = tostring(math.Round(100-(panel11.a+panel11.b),1)) .. "%"
			love.graphics.print(str, panel11:GetX()+math.Remap(panel11.b,0,100,0,375)+math.Remap(panel11.a,0,100,0,375)+math.Max(0,math.Remap(100-(panel11.b+panel11.a),0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel11:GetY()+4)

	    end


	local remunerationInvestisseur = loveframes.Create("imagebutton", panel1)
	remunerationInvestisseur:SetPos(25,130):SetText(tostring(minimal2Rendement or 0).."%")
	remunerationInvestisseur.OnClick = function(object)
	local textboxRemuneration = loveframes.Create("textinput", panel1)
		textboxRemuneration:SetWidth(50)
		textboxRemuneration:SetPos(18+12,147):SetValue(tostring(minimal2Rendement or 0))
		textboxRemuneration.OnEnter = function(object,text)
			minimal2Rendement = tonumber(text)
			remunerationInvestisseur:SetText(tostring(minimal2Rendement).."%")
			textboxRemuneration:Remove()
		end
	end



	local remunerationInvestisseur2 = loveframes.Create("imagebutton", panel1)
	remunerationInvestisseur2:SetPos(35+110,130):SetText(tostring(middle2Rendement or 0).."%")
	remunerationInvestisseur2.OnClick = function(object)
	local textboxRemuneration2 = loveframes.Create("textinput", panel1)
		textboxRemuneration2:SetWidth(50)
		textboxRemuneration2:SetPos(28+12+110,147):SetValue(tostring(middle2Rendement or 0))
		textboxRemuneration2.OnEnter = function(object,text)
			middle2Rendement = tonumber(text)
			remunerationInvestisseur2:SetText(tostring(middle2Rendement).."%")
			textboxRemuneration2:Remove()
		end
	end



	local remunerationInvestisseur3 = loveframes.Create("imagebutton", panel1)
	remunerationInvestisseur3:SetPos(35+230,130):SetText(tostring(maximal2Rendement or 0).."%")
	remunerationInvestisseur3.OnClick = function(object)
	local textboxRemuneration3 = loveframes.Create("textinput", panel1)
		textboxRemuneration3:SetWidth(50)
		textboxRemuneration3:SetPos(28+12+230,147):SetValue(tostring(maximal2Rendement or 0))
		textboxRemuneration3.OnEnter = function(object,text)
			maximal2Rendement = tonumber(text)
			remunerationInvestisseur3:SetText(tostring(maximal2Rendement).."%")
			textboxRemuneration3:Remove()
		end
	end



	   local slider1 = loveframes.Create("slider", panel1)
	   local slider2 = loveframes.Create("slider", panel1)
		slider1:SetPos(-30000, -14000)
		slider1:SetWidth(370)
		slider1:SetMinMax(0, (100/3)*2)
		slider2:SetPos(-30000, -14000)
		slider2:SetWidth(370)
		slider2:SetMinMax(0, 100)

		slider1:SetValue(100/3)
		slider1.OnValueChanged = function(object)
		--print(math.Remap(panel11.a,0,100,0,375))
			panel11.a = object:GetValue()
			minimalTimeInvestment = panel11.a * 2
			if (slider2:GetValue() + object:GetValue()) > 100 then
				slider2:SetValue(100-(panel11.a))
			end
			object:SetMinMax(0,100-panel11.b)
		end
	


		slider2.OnValueChanged = function(object, dt)
			panel11.b = object:GetValue()
			middleTimeInvestment = panel11.b * 2
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
			love.graphics.print(math.Round(panel11.a) * 2, object:GetX()+4,object:GetY()+3)
		end

		button1.OnMouseReleased = function()
			hook.Remove("Think", "button follow mouse")
		end
	


-------------------------------------------------------------------------

		local button2 = loveframes.Create("button", panel1)
		button2:SetWidth(20)
		button2:SetHeight(20)
		button2:SetPos(30+panel11:GetX()+math.Remap(panel11.a,0,100,0,375)+math.Remap(panel11.b,0,100,0,375)-10, 115)
		button2.Draw= function(object)
			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
			love.graphics.draw(buttonpic,quad,object:GetX()+21 ,object:GetY()+23,math.rad(180))
			love.graphics.setFont(fluwtexttuto)
			love.graphics.print(math.Round((panel11.b + panel11.a) * 2), object:GetX()+4,object:GetY()+5)
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
		--------------------------------------------[[MULTI-SLIDER N°2]]----------------------------------------------------------------
		--------------------------------------------------------------------------------------------------------------------------------


		if not containerInvestissement2 then
			local containerInvestissement2 = loveframes.Create("image", panel1)
	    	containerInvestissement2:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(210)
	   		local titleContainerInvestissement2 = loveframes.Create("text", panel1)
	    	titleContainerInvestissement2:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Points par Montant (Millions F)"):Center():SetY(214)
	 	end

		local panel12 =  loveframes.Create("panel", panel1)
        panel12.a = 100/3
	    panel12.b = 100/3
	    panel12:SetSize(375,40)
	    panel12:SetPos(30,280)
	    panel12.Draw = function()
	    	love.graphics.setFont(sliderbarfont)
	    	love.graphics.setColor(255,255,255)
	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel12.a,0,100,0,375),30, 3, 54)
			love.graphics.draw(gr1,quad ,panel12:GetX(), panel12:GetY())
			

			local str = tostring(math.Round(panel12.a,1)) .. "%"
			love.graphics.print(str, panel12:GetX()+math.Max(0,math.Remap(panel12.a,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel12:GetY()+4)

			love.graphics.setColor(255,255,255)
	    	local quad = love.graphics.newQuad(0,0,math.Remap(panel12.b,0,100,0,375),30, 3, 54)
			love.graphics.draw(gr2,quad ,panel12:GetX()+math.Remap(panel12.a,0,100,0,375), panel12:GetY())

			love.graphics.setColor(0,0,0)
			local str =tostring(math.Round(panel12.b,1)) .. "%"
			love.graphics.print(str, panel12:GetX()+math.Remap(panel12.a,0,100,0,375)+math.Max(0,math.Remap(panel12.b,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel12:GetY()+4)

			love.graphics.setColor(255,255,255)
			local quad = love.graphics.newQuad(0,0,math.Remap(100-panel12.b-panel12.a,0,100,0,375),30, 3, 54)
			love.graphics.draw(gr3,quad ,panel12:GetX()+math.Remap(panel12.a,0,100,0,375)+math.Remap(panel12.b,0,100,0,375), panel12:GetY())

			love.graphics.setColor(0,0,0)
			local str = tostring(math.Round(100-(panel12.a+panel12.b),1)) .. "%"
			love.graphics.print(str, panel12:GetX()+math.Remap(panel12.b,0,100,0,375)+math.Remap(panel12.a,0,100,0,375)+math.Max(0,math.Remap(100-(panel12.b+panel12.a),0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel12:GetY()+4)

	    end

		local remunerationInvestisseur4 = loveframes.Create("imagebutton", panel1)
		remunerationInvestisseur4:SetPos(25,330):SetText(tostring(minimalRendement or 0).."%")
		remunerationInvestisseur4.OnClick = function(object)
		local textboxRemuneration4 = loveframes.Create("textinput", panel1)
			textboxRemuneration4:SetWidth(50)
			textboxRemuneration4:SetPos(18+12,352):SetValue(tostring(minimalRendement or 0))
			textboxRemuneration4.OnEnter = function(object,text)
				minimalRendement = tonumber(text)
				remunerationInvestisseur4:SetText(tostring(minimalRendement).."%")
				textboxRemuneration4:Remove()
			end
		end



		local remunerationInvestisseur5 = loveframes.Create("imagebutton", panel1)
		remunerationInvestisseur5:SetPos(35+110,330):SetText(tostring(middleRendement or 0).."%")
		remunerationInvestisseur5.OnClick = function(object)
		local textboxRemuneration5 = loveframes.Create("textinput", panel1)
			textboxRemuneration5:SetWidth(50)
			textboxRemuneration5:SetPos(28+12+110,352):SetValue(tostring(middleRendement or 0))
			textboxRemuneration5.OnEnter = function(object,text)
				middleRendement = tonumber(text)
				remunerationInvestisseur5:SetText(tostring(middleRendement).."%")
				textboxRemuneration5:Remove()
			end
		end



		local remunerationInvestisseur6 = loveframes.Create("imagebutton", panel1)
		remunerationInvestisseur6:SetPos(35+230,330):SetText(tostring(maximalRendement or 0).."%")
		remunerationInvestisseur6.OnClick = function(object)
		local textboxRemuneration6 = loveframes.Create("textinput", panel1)
			textboxRemuneration6:SetWidth(50)
			textboxRemuneration6:SetPos(28+12+230,352):SetValue(tostring(maximalRendement or 0))
			textboxRemuneration6.OnEnter = function(object,text)
				maximalRendement = tonumber(text)
				remunerationInvestisseur6:SetText(tostring(maximalRendement).."%")
				textboxRemuneration6:Remove()
			end
		end

	    	

	   local slider3 = loveframes.Create("slider", panel1)
	   local slider4 = loveframes.Create("slider", panel1)
		slider3:SetPos(-30000, -14000)
		slider3:SetWidth(370)
		slider3:SetMinMax(0, (100/3)*2)
		slider4:SetPos(-30000, -14000)
		slider4:SetWidth(370)
		slider4:SetMinMax(0, 100)

		slider3:SetValue(100/3)
		slider3.OnValueChanged = function(object)
		--print(math.Remap(panel12.a,0,100,0,375))
			panel12.a = object:GetValue()
			minimalInvestment = panel12.a * 1000000
			if (slider4:GetValue() + object:GetValue()) > 100 then
				slider4:SetValue(100-(panel12.a))
			end
			object:SetMinMax(0,100-panel12.b)
		end
	


		slider4.OnValueChanged = function(object, dt)
			panel12.b = object:GetValue()
			middleInvestment = panel12.b * 1000000
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
		button4:SetPos(30+panel12:GetX()+math.Remap(panel12.a,0,100,0,375)+math.Remap(panel12.b,0,100,0,375)-10, 314)
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

		local infoBoxInvestissement = loveframes.Create("image", panel1)
	    infoBoxInvestissement:SetImage("ressources/UiRackBlockPostIt.png"):SetScale(0.55,0.43):Center():SetY(410)
	    local textInfoBoxInvestissement = loveframes.Create("text", panel1)
	    textInfoBoxInvestissement:SetText("Assignez des points pour chaque tranche. \nLe Taux de Rémunération d'un Investisseur est la somme :\n\tPoint pour durée + Points pour montant\n\nLa rémunération à verser s'ajoute à vos frais annuels. \nUn taux élevé augmente votre popularité et attire plus \nd'investisseurs !"):SetPos(20,425)

    local panel2 = loveframes.Create("panel")
    tabsmenudown:AddTab("Créditeurs", panel2, "Créditeurs")

	    --------------------------------------------------------------------------------------------------------------------------------
	    --------------------------------------------[[MULTI-SLIDER N°1]]----------------------------------------------------------------
	    --------------------------------------------------------------------------------------------------------------------------------

	    if not containerInvestissement then
		    local containerInvestissement = loveframes.Create("image", panel2)
		    containerInvestissement:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(10)
		    local titleContainerInvestissement = loveframes.Create("text", panel2)
		    titleContainerInvestissement:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Revenus Annuels Brut (k F)"):Center():SetY(14)
		end




	    local panel13 =  loveframes.Create("panel", panel2)
	        panel13.a = 100/3
		    panel13.b = 100/3
		    panel13:SetSize(375,40)
		    panel13:SetPos(30,80)
		    panel13.Draw = function()
		    	love.graphics.setFont(sliderbarfont)
		    	love.graphics.setColor(255,255,255)
		    	local quad = love.graphics.newQuad(0,0,math.Remap(panel13.a,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr1,quad ,panel13:GetX(), panel13:GetY())
				

				local str = tostring(math.Round(panel13.a,1)) .. "%"
				love.graphics.print(str, panel13:GetX()+math.Max(0,math.Remap(panel13.a,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel13:GetY()+4)

				love.graphics.setColor(255,255,255)
		    	local quad = love.graphics.newQuad(0,0,math.Remap(panel13.b,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr2,quad ,panel13:GetX()+math.Remap(panel13.a,0,100,0,375), panel13:GetY())

				love.graphics.setColor(0,0,0)
				local str =tostring(math.Round(panel13.b,1)) .. "%"
				love.graphics.print(str, panel13:GetX()+math.Remap(panel13.a,0,100,0,375)+math.Max(0,math.Remap(panel13.b,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel13:GetY()+4)

				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,math.Remap(100-panel13.b-panel13.a,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr3,quad ,panel13:GetX()+math.Remap(panel13.a,0,100,0,375)+math.Remap(panel13.b,0,100,0,375), panel13:GetY())

				love.graphics.setColor(0,0,0)
				local str = tostring(math.Round(100-(panel13.a+panel13.b),1)) .. "%"
				love.graphics.print(str, panel13:GetX()+math.Remap(panel13.b,0,100,0,375)+math.Remap(panel13.a,0,100,0,375)+math.Max(0,math.Remap(100-(panel13.b+panel13.a),0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel13:GetY()+4)

		    end


		local interetCrediteur = loveframes.Create("imagebutton", panel2)
		interetCrediteur:SetPos(25,130):SetText(tostring(minimalCrediteurIncomesBehoof or 0).."%")
		interetCrediteur.OnClick = function(object)
		local textboxInteret = loveframes.Create("textinput", panel2)
			textboxInteret:SetWidth(50)
			textboxInteret:SetPos(18+12,147):SetValue(tostring(minimalCrediteurIncomesBehoof or 0))
			textboxInteret.OnEnter = function(object,text)
				minimalCrediteurIncomesBehoof = tonumber(text)
				interetCrediteur:SetText(tostring(minimalCrediteurIncomesBehoof).."%")
				textboxInteret:Remove()
			end
		end



		local interetCrediteur2 = loveframes.Create("imagebutton", panel2)
		interetCrediteur2:SetPos(35+110,130):SetText(tostring(middleCrediteurIncomesBehoof or 0).."%")
		interetCrediteur2.OnClick = function(object)
		local textboxInteret2 = loveframes.Create("textinput", panel2)
			textboxInteret2:SetWidth(50)
			textboxInteret2:SetPos(28+12+110,147):SetValue(tostring(middleCrediteurIncomesBehoof or 0))
			textboxInteret2.OnEnter = function(object,text)
				middleCrediteurIncomesBehoof = tonumber(text)
				interetCrediteur2:SetText(tostring(middleCrediteurIncomesBehoof).."%")
				textboxInteret2:Remove()
			end
		end



		local interetCrediteur3 = loveframes.Create("imagebutton", panel2)
		interetCrediteur3:SetPos(35+230,130):SetText(tostring(maximalCrediteurIncomesBehoof or 0).."%")
		interetCrediteur3.OnClick = function(object)
		local textboxInteret3 = loveframes.Create("textinput", panel2)
			textboxInteret3:SetWidth(50)
			textboxInteret3:SetPos(28+12+230,147):SetValue(tostring(maximalCrediteurIncomesBehoof or 0))
			textboxInteret3.OnEnter = function(object,text)
				maximalCrediteurIncomesBehoof = tonumber(text)
				interetCrediteur3:SetText(tostring(maximalCrediteurIncomesBehoof).."%")
				textboxInteret3:Remove()
			end
		end



		   local slider1 = loveframes.Create("slider", panel2)
		   local slider2 = loveframes.Create("slider", panel2)
			slider1:SetPos(-30000, -14000)
			slider1:SetWidth(370)
			slider1:SetMinMax(0, (100/3)*2)
			slider2:SetPos(-30000, -14000)
			slider2:SetWidth(370)
			slider2:SetMinMax(0, 100)

			slider1:SetValue(100/3)
			slider1.OnValueChanged = function(object)
			--print(math.Remap(panel11.a,0,100,0,375))
				panel13.a = object:GetValue()
				lowCrediteurIncomes = panel13.a * 2
				if (slider2:GetValue() + object:GetValue()) > 100 then
					slider2:SetValue(100-(panel13.a))
				end
				object:SetMinMax(0,100-panel13.b)
			end
		


			slider2.OnValueChanged = function(object, dt)
				panel13.b = object:GetValue()
				middleCrediteurIncomes = panel13.b * 2
				object:SetMinMax(0, 100-(slider1:GetValue()))
			end


	-------------------------------------------------------------------------

			local button1 = loveframes.Create("button", panel2)
			button1:SetWidth(20)
			button1:SetHeight(20)
			button1:SetPos(30+panel13:GetX()+math.Remap(panel13.a,0,100,0,375)-10, 54)
			button1.Draw= function(object)
				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
				love.graphics.draw(buttonpic,quad,object:GetX() ,object:GetY())
				love.graphics.setFont(fluwtexttuto)
				love.graphics.print(math.Round(panel13.a) * 2, object:GetX()+4,object:GetY()+3)
			end

			button1.OnMouseReleased = function()
				hook.Remove("Think", "button follow mouse")
			end
		


	-------------------------------------------------------------------------

			local button2 = loveframes.Create("button", panel2)
			button2:SetWidth(20)
			button2:SetHeight(20)
			button2:SetPos(30+panel13:GetX()+math.Remap(panel13.a,0,100,0,375)+math.Remap(panel13.b,0,100,0,375)-10, 115)
			button2.Draw= function(object)
				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
				love.graphics.draw(buttonpic,quad,object:GetX()+21 ,object:GetY()+23,math.rad(180))
				love.graphics.setFont(fluwtexttuto)
				love.graphics.print(math.Round((panel13.b + panel13.a) * 2), object:GetX()+4,object:GetY()+5)
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
						button2:SetX(math.Max(math.Min(love.mouse.getX()-57, 405-10),77+math.Remap(panel13.a,0,100,0,375)-50))
						slider2:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100)-panel13.a)

					end
				end )
			end




			button1.OnMousePressed = function() 
			if not button1.down then return end
				hook.Add("Think", "button follow mouse", function()
					
					local min = 57+20
					local max = 57+20+375
					if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
						button1:SetX(math.Min(love.mouse.getX()-57, 405-math.Remap(panel13.b,0,100,0,375)-10))
						slider1:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100))
						button2:SetX(math.Remap(panel13.b+ panel13.a,0,100,0,375)+20)
					end
				end )
			end


			--------------------------------------------------------------------------------------------------------------------------------
			--------------------------------------------[[MULTI-SLIDER N°2]]----------------------------------------------------------------
			--------------------------------------------------------------------------------------------------------------------------------


			if not containerInvestissement2 then
				local containerInvestissement2 = loveframes.Create("image", panel2)
		    	containerInvestissement2:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(200)
		   		local titleContainerInvestissement2 = loveframes.Create("text", panel2)
		    	titleContainerInvestissement2:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Durée de Remboursement (Années)"):Center():SetY(204)
		 	end

			local panel14 =  loveframes.Create("panel", panel2)
	        panel14.a = 100/3
		    panel14.b = 100/3
		    panel14:SetSize(375,40)
		    panel14:SetPos(30,270)
		    panel14.Draw = function()
		    	love.graphics.setFont(sliderbarfont)
		    	love.graphics.setColor(255,255,255)
		    	local quad = love.graphics.newQuad(0,0,math.Remap(panel14.a,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr1,quad ,panel14:GetX(), panel14:GetY())
				

				local str = tostring(math.Round(panel14.a,1)) .. "%"
				love.graphics.print(str, panel14:GetX()+math.Max(0,math.Remap(panel14.a,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel14:GetY()+4)

				love.graphics.setColor(255,255,255)
		    	local quad = love.graphics.newQuad(0,0,math.Remap(panel14.b,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr2,quad ,panel14:GetX()+math.Remap(panel14.a,0,100,0,375), panel14:GetY())

				love.graphics.setColor(0,0,0)
				local str =tostring(math.Round(panel14.b,1)) .. "%"
				love.graphics.print(str, panel14:GetX()+math.Remap(panel14.a,0,100,0,375)+math.Max(0,math.Remap(panel14.b,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel14:GetY()+4)

				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,math.Remap(100-panel14.b-panel14.a,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr3,quad ,panel14:GetX()+math.Remap(panel14.a,0,100,0,375)+math.Remap(panel14.b,0,100,0,375), panel14:GetY())

				love.graphics.setColor(0,0,0)
				local str = tostring(math.Round(100-(panel14.a+panel14.b),1)) .. "%"
				love.graphics.print(str, panel14:GetX()+math.Remap(panel14.b,0,100,0,375)+math.Remap(panel14.a,0,100,0,375)+math.Max(0,math.Remap(100-(panel14.b+panel14.a),0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel14:GetY()+4)

		    end

			local remunerationInvestisseur4 = loveframes.Create("imagebutton", panel2)
			remunerationInvestisseur4:SetPos(25,320):SetText(tostring(minimalCrediteurTimeBehoof or 0).."%")
			remunerationInvestisseur4.OnClick = function(object)
			local textboxRemuneration4 = loveframes.Create("textinput", panel2)
				textboxRemuneration4:SetWidth(50)
				textboxRemuneration4:SetPos(18+12,342):SetValue(tostring(minimalCrediteurTimeBehoof or 0))
				textboxRemuneration4.OnEnter = function(object,text)
					minimalCrediteurTimeBehoof = tonumber(text)
					remunerationInvestisseur4:SetText(tostring(minimalCrediteurTimeBehoof).."%")
					textboxRemuneration4:Remove()
				end
			end



			local remunerationInvestisseur5 = loveframes.Create("imagebutton", panel2)
			remunerationInvestisseur5:SetPos(35+110,320):SetText(tostring(middleCrediteurTimeBehoof or 0).."%")
			remunerationInvestisseur5.OnClick = function(object)
			local textboxRemuneration5 = loveframes.Create("textinput", panel2)
				textboxRemuneration5:SetWidth(50)
				textboxRemuneration5:SetPos(28+12+110,342):SetValue(tostring(middleCrediteurTimeBehoof or 0))
				textboxRemuneration5.OnEnter = function(object,text)
					middleCrediteurTimeBehoof = tonumber(text)
					remunerationInvestisseur5:SetText(tostring(middleCrediteurTimeBehoof).."%")
					textboxRemuneration5:Remove()
				end
			end



			local remunerationInvestisseur6 = loveframes.Create("imagebutton", panel2)
			remunerationInvestisseur6:SetPos(35+230,320):SetText(tostring(maximalCrediteurTimeBehoof or 0).."%")
			remunerationInvestisseur6.OnClick = function(object)
			local textboxRemuneration6 = loveframes.Create("textinput", panel2)
				textboxRemuneration6:SetWidth(50)
				textboxRemuneration6:SetPos(28+12+230,342):SetValue(tostring(maximalCrediteurTimeBehoof or 0))
				textboxRemuneration6.OnEnter = function(object,text)
					maximalCrediteurTimeBehoof = tonumber(text)
					remunerationInvestisseur6:SetText(tostring(maximalCrediteurTimeBehoof).."%")
					textboxRemuneration6:Remove()
				end
			end

		    	

		   local slider3 = loveframes.Create("slider", panel2)
		   local slider4 = loveframes.Create("slider", panel2)
			slider3:SetPos(-30000, -14000)
			slider3:SetWidth(370)
			slider3:SetMinMax(0, (100/3)*2)
			slider4:SetPos(-30000, -14000)
			slider4:SetWidth(370)
			slider4:SetMinMax(0, 100)

			slider3:SetValue(100/3)
			slider3.OnValueChanged = function(object)
			--print(math.Remap(panel12.a,0,100,0,375))
				panel14.a = object:GetValue()
				lowCrediteurTime = panel14.a * 1000000
				if (slider4:GetValue() + object:GetValue()) > 100 then
					slider4:SetValue(100-(panel14.a))
				end
				object:SetMinMax(0,100-panel14.b)
			end
		


			slider4.OnValueChanged = function(object, dt)
				panel14.b = object:GetValue()
				middleCrediteurTime = panel14.b * 1000000
				object:SetMinMax(0, 100-(slider3:GetValue()))
			end


	-------------------------------------------------------------------------

			local button3 = loveframes.Create("button", panel2)
			button3:SetWidth(20)
			button3:SetHeight(20)
			button3:SetPos(30+panel14:GetX()+math.Remap(panel14.a,0,100,0,375)-10, 244)
			button3.Draw= function(object)
				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
				love.graphics.draw(buttonpic,quad,object:GetX() ,object:GetY())
				love.graphics.setFont(fluwtexttuto)
				love.graphics.print(math.Round(panel14.a), object:GetX()+4,object:GetY()+3)
			end

			button3.OnMouseReleased = function()
				hook.Remove("Think", "button follow mouse")
			end
		


	-------------------------------------------------------------------------

			local button4 = loveframes.Create("button", panel2)
			button4:SetWidth(20)
			button4:SetHeight(20)
			button4:SetPos(30+panel14:GetX()+math.Remap(panel14.a,0,100,0,375)+math.Remap(panel14.b,0,100,0,375)-10, 304)
			button4.Draw= function(object)
				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
				love.graphics.draw(buttonpic,quad,object:GetX()+21 ,object:GetY()+23,math.rad(180))
				love.graphics.setFont(fluwtexttuto)
				love.graphics.print(math.Round(panel14.b + panel14.a), object:GetX()+4,object:GetY()+5)
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
						button4:SetX(math.Max(math.Min(love.mouse.getX()-57, 405-10),77+math.Remap(panel14.a,0,100,0,375)-50))
						slider4:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100)-panel14.a)

					end
				end )
			end




			button3.OnMousePressed = function() 
			if not button3.down then return end
				hook.Add("Think", "button follow mouse", function()
					
					local min = 57+20
					local max = 57+20+375
					if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
						button3:SetX(math.Min(love.mouse.getX()-57, 405-math.Remap(panel14.b,0,100,0,375)-10))
						slider3:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100))
						button4:SetX(math.Remap(panel14.b+ panel14.a,0,100,0,375)+20)
					end
				end )
			end


			--------------------------------------------------------------------------------------------------------------------------------
			--------------------------------------------[[MULTI-SLIDER N°3]]----------------------------------------------------------------
			--------------------------------------------------------------------------------------------------------------------------------


			if not containerInvestissement2 then
				local containerInvestissement2 = loveframes.Create("image", panel2)
		    	containerInvestissement2:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(390)
		   		local titleContainerInvestissement2 = loveframes.Create("text", panel2)
		    	titleContainerInvestissement2:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Montant du Crédit (k F)"):Center():SetY(394)
		 	end

			local panel15 =  loveframes.Create("panel", panel2)
	        panel15.a = 100/3
		    panel15.b = 100/3
		    panel15:SetSize(375,40)
		    panel15:SetPos(30,460)
		    panel15.Draw = function()
		    	love.graphics.setFont(sliderbarfont)
		    	love.graphics.setColor(255,255,255)
		    	local quad = love.graphics.newQuad(0,0,math.Remap(panel15.a,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr1,quad ,panel15:GetX(), panel15:GetY())
				

				local str = tostring(math.Round(panel15.a,1)) .. "%"
				love.graphics.print(str, panel15:GetX()+math.Max(0,math.Remap(panel15.a,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel15:GetY()+4)

				love.graphics.setColor(255,255,255)
		    	local quad = love.graphics.newQuad(0,0,math.Remap(panel15.b,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr2,quad ,panel15:GetX()+math.Remap(panel15.a,0,100,0,375), panel15:GetY())

				love.graphics.setColor(0,0,0)
				local str =tostring(math.Round(panel15.b,1)) .. "%"
				love.graphics.print(str, panel15:GetX()+math.Remap(panel15.a,0,100,0,375)+math.Max(0,math.Remap(panel15.b,0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel15:GetY()+4)

				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,math.Remap(100-panel15.b-panel15.a,0,100,0,375),30, 3, 54)
				love.graphics.draw(gr3,quad ,panel15:GetX()+math.Remap(panel15.a,0,100,0,375)+math.Remap(panel15.b,0,100,0,375), panel15:GetY())

				love.graphics.setColor(0,0,0)
				local str = tostring(math.Round(100-(panel15.a+panel15.b),1)) .. "%"
				love.graphics.print(str, panel15:GetX()+math.Remap(panel15.b,0,100,0,375)+math.Remap(panel15.a,0,100,0,375)+math.Max(0,math.Remap(100-(panel15.b+panel15.a),0,100,0,375)/2-sliderbarfont:getWidth(str)/2),panel15:GetY()+4)

		    end

			local remunerationInvestisseur4 = loveframes.Create("imagebutton", panel2)
			remunerationInvestisseur4:SetPos(25,510):SetText(tostring(minimalCrediteurAskBehoof or 0).."%")
			remunerationInvestisseur4.OnClick = function(object)
			local textboxRemuneration4 = loveframes.Create("textinput", panel2)
				textboxRemuneration4:SetWidth(50)
				textboxRemuneration4:SetPos(18+12,552):SetValue(tostring(minimalCrediteurAskBehoof or 0))
				textboxRemuneration4.OnEnter = function(object,text)
					minimalCrediteurAskBehoof = tonumber(text)
					remunerationInvestisseur4:SetText(tostring(minimalCrediteurAskBehoof).."%")
					textboxRemuneration4:Remove()
				end
			end



			local remunerationInvestisseur5 = loveframes.Create("imagebutton", panel2)
			remunerationInvestisseur5:SetPos(35+110,510):SetText(tostring(middleCrediteurAskBehoof or 0).."%")
			remunerationInvestisseur5.OnClick = function(object)
			local textboxRemuneration5 = loveframes.Create("textinput", panel2)
				textboxRemuneration5:SetWidth(50)
				textboxRemuneration5:SetPos(28+12+110,532):SetValue(tostring(middleCrediteurAskBehoof or 0))
				textboxRemuneration5.OnEnter = function(object,text)
					middleCrediteurAskBehoof = tonumber(text)
					remunerationInvestisseur5:SetText(tostring(middleCrediteurAskBehoof).."%")
					textboxRemuneration5:Remove()
				end
			end



			local remunerationInvestisseur6 = loveframes.Create("imagebutton", panel2)
			remunerationInvestisseur6:SetPos(35+230,510):SetText(tostring(maximalCrediteurAskBehoof or 0).."%")
			remunerationInvestisseur6.OnClick = function(object)
			local textboxRemuneration6 = loveframes.Create("textinput", panel2)
				textboxRemuneration6:SetWidth(50)
				textboxRemuneration6:SetPos(28+12+230,532):SetValue(tostring(maximalCrediteurAskBehoof or 0))
				textboxRemuneration6.OnEnter = function(object,text)
					maximalCrediteurAskBehoof = tonumber(text)
					remunerationInvestisseur6:SetText(tostring(maximalCrediteurAskBehoof).."%")
					textboxRemuneration6:Remove()
				end
			end

		    	

		   local slider5 = loveframes.Create("slider", panel2)
		   local slider6 = loveframes.Create("slider", panel2)
			slider5:SetPos(-30000, -14000)
			slider5:SetWidth(370)
			slider5:SetMinMax(0, (100/3)*2)
			slider5:SetPos(-30000, -14000)
			slider5:SetWidth(370)
			slider5:SetMinMax(0, 100)

			slider5:SetValue(100/3)
			slider5.OnValueChanged = function(object)
			--print(math.Remap(panel12.a,0,100,0,375))
				panel15.a = object:GetValue()
				lowCrediteurAsk = panel15.a * 1000000
				if (slider6:GetValue() + object:GetValue()) > 100 then
					slider6:SetValue(100-(panel15.a))
				end
				object:SetMinMax(0,100-panel15.b)
			end
		


			slider6.OnValueChanged = function(object, dt)
				panel15.b = object:GetValue()
				middleCrediteurAsk = panel15.b * 1000000
				object:SetMinMax(0, 100-(slider5:GetValue()))
			end


	-------------------------------------------------------------------------

			local button3 = loveframes.Create("button", panel2)
			button3:SetWidth(20)
			button3:SetHeight(20)
			button3:SetPos(30+panel15:GetX()+math.Remap(panel15.a,0,100,0,375)-10, 434)
			button3.Draw= function(object)
				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
				love.graphics.draw(buttonpic,quad,object:GetX() ,object:GetY())
				love.graphics.setFont(fluwtexttuto)
				love.graphics.print(math.Round(panel15.a), object:GetX()+4,object:GetY()+3)
			end

			button3.OnMouseReleased = function()
				hook.Remove("Think", "button follow mouse")
			end
		


	-------------------------------------------------------------------------

			local button4 = loveframes.Create("button", panel2)
			button4:SetWidth(20)
			button4:SetHeight(20)
			button4:SetPos(30+panel15:GetX()+math.Remap(panel15.a,0,100,0,375)+math.Remap(panel15.b,0,100,0,375)-10, 494)
			button4.Draw= function(object)
				love.graphics.setColor(255,255,255)
				local quad = love.graphics.newQuad(0,0,62,91, 20, 29)
				love.graphics.draw(buttonpic,quad,object:GetX()+21 ,object:GetY()+23,math.rad(180))
				love.graphics.setFont(fluwtexttuto)
				love.graphics.print(math.Round(panel15.b + panel15.a), object:GetX()+4,object:GetY()+5)
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
						button4:SetX(math.Max(math.Min(love.mouse.getX()-57, 405-10),77+math.Remap(panel15.a,0,100,0,375)-50))
						slider6:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100)-panel15.a)

					end
				end )
			end




			button3.OnMousePressed = function() 
			if not button3.down then return end
				hook.Add("Think", "button follow mouse", function()
					
					local min = 57+20
					local max = 57+20+375
					if (love.mouse.getX( ) > min ) and (love.mouse.getX( ) < max) then
						button3:SetX(math.Min(love.mouse.getX()-57, 405-math.Remap(panel15.b,0,100,0,375)-10))
						slider5:SetValue(math.Remap(love.mouse.getX()-57-30+10,0,375,0,100))
						button4:SetX(math.Remap(panel15.b+ panel15.a,0,100,0,375)+20)
					end
				end )
			end

			--------------------------------------------------------------------------------------------------------------------------------
			--------------------------------------------------------------------------------------------------------------------------------
			--------------------------------------------------------------------------------------------------------------------------------


    local panel3 = loveframes.Create("panel")
    tabsmenudown:AddTab("Achats/Ventes", panel3, "Achats/Ventes")

    local panel4 = loveframes.Create("panel")
    tabsmenudown:AddTab("Personel", panel4, "Personel")

	    local containerPersonnel = loveframes.Create("image", panel4)
		containerPersonnel:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.40):Center():SetY(10)
		local titleContainerPersonnel = loveframes.Create("text", panel4)
	    titleContainerPersonnel:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Détail de l'effectif"):Center():SetY(14)
	    local detailsTextPersonnel = loveframes.Create("text", panel4)
	    detailsTextPersonnel:SetFont(date_box_text2):SetPos(10,52):SetText("  Employés\t\tSalaire Brut (F)\t  Coût Total des Salariés (F)")
	    local detailsTextPersonnel2 = loveframes.Create("text", panel4)
	    detailsTextPersonnel2:SetText("/mois\t\t\t\t\t\t\t\t\t/mois\n\n\n/an\t\t\t\t\t\t\t\t\t\t/an"):SetPos(180,92)
	    local detailsTextPersonnel3 = loveframes.Create("text", panel4)
	    detailsTextPersonnel3:SetFont(popuptitle):SetText({ {color = {52, 192, 62, 255}}, nbEmployees}):SetPos(40,90)
	    local detailsTextPersonnel4 = loveframes.Create("text", panel4)
	    detailsTextPersonnel4:SetFont(popuptitle):SetText({ {color = {52, 192, 62, 255}}, string.nicemath(Salary)}):SetPos(170 - popuptitle:getWidth(string.nicemath(Salary)),77)
	    local detailsTextPersonnel5 = loveframes.Create("text", panel4)
	    detailsTextPersonnel5:SetFont(popuptitle):SetText({ {color = {52, 192, 62, 255}}, string.nicemath(Salary*nbEmployees)}):SetPos(350 - popuptitle:getWidth(string.nicemath(Salary*nbEmployees)),77)
	    local detailsTextPersonnel6 = loveframes.Create("text", panel4)
	    detailsTextPersonnel6:SetFont(popuptitle):SetText({ {color = {52, 192, 62, 255}}, string.nicemath(Salary*12)}):SetPos(170 - popuptitle:getWidth(string.nicemath(Salary*12)),117)
	    local detailsTextPersonnel7 = loveframes.Create("text", panel4)
	    detailsTextPersonnel7:SetFont(popuptitle):SetText({ {color = {52, 192, 62, 255}}, string.nicemath(Salary*nbEmployees*12)}):SetPos(350 - popuptitle:getWidth(string.nicemath(Salary*nbEmployees*12)),117)

		local containerPersonnel2 = loveframes.Create("image", panel4)
		containerPersonnel2:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(190)
		local titleContainerPersonnel2 = loveframes.Create("text", panel4)
	    titleContainerPersonnel2:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Gestion de l'effectif"):Center():SetY(194)
	    local textContainerPersonnel2 = loveframes.Create("text", panel4)
	    textContainerPersonnel2:SetFont(date_box_text2):SetDefaultColor(0,0,0,255):SetText("Employés"):SetPos(26,235)
	    local numberboxPersonnel2 = loveframes.Create("numberbox", panel4)
	    numberboxPersonnel2:SetPos(35, 270):SetSize(50,20):SetIncreaseAmount(1):SetDecreaseAmount(1):SetValue(nbEmployees):SetMin(0)
	    local clickablePersonnel2 = loveframes.Create("imagebutton", panel4)
	    clickablePersonnel2:SetImage("ressources/UiBtnFixed.png"):SetPos(110,240):SetText("Modifier le nombre d'employés"):SizeToImage()
	    clickablePersonnel2.OnClick = function(object)
	    	nbEmployees = numberboxPersonnel2:GetValue()
	    	detailsTextPersonnel3:SetText({ {color = {52, 192, 62, 255}}, nbEmployees})
	    end
	    local infoBoxPersonnel2 = loveframes.Create("image", panel4)
	    infoBoxPersonnel2:SetImage("ressources/UiRackinfosBlock2.png"):SetScale(0.5,0.5):Center():SetY(310)
	    local textInfoBoxPersonnel2 = loveframes.Create("text", panel4)
	    textInfoBoxPersonnel2:SetText("Diminuez ou augmenter l'effectif de votre banque, et \nconfirmez avec le bouton ci-dessus"):SetPos(45, 320)
	    numberboxPersonnel2.OnValueChanged = function(value)
	    	if numberboxPersonnel2:GetValue() > nbEmployees then
	    		clickablePersonnel2:SetText("Recruter "..numberboxPersonnel2:GetValue() - nbEmployees.." nouveaux employés")
	    		textInfoBoxPersonnel2:SetText("En recrutant "..numberboxPersonnel2:GetValue() - nbEmployees.." nouveaux employés :\n\t- Frais mensuels : +"..(numberboxPersonnel2:GetValue() - nbEmployees)*Salary.."F")
	    	elseif numberboxPersonnel2:GetValue() < nbEmployees then
	    		clickablePersonnel2:SetText("Licencier "..nbEmployees - numberboxPersonnel2:GetValue().." employés")
	    		textInfoBoxPersonnel2:SetText("En licenciant "..nbEmployees - numberboxPersonnel2:GetValue().." employés :\n\t- Economies mensuelles : +"..(nbEmployees - numberboxPersonnel2:GetValue())*Salary.."F")
	    	end
	    end

	    local containerPersonnel3 = loveframes.Create("image", panel4)
		containerPersonnel3:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(380)
		local titleContainerPersonnel3 = loveframes.Create("text", panel4)
	    titleContainerPersonnel3:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Gestion de l'effectif"):Center():SetY(384)
	    local textContainerPersonnel3 = loveframes.Create("text", panel4)
	    textContainerPersonnel3:SetFont(date_box_text2):SetDefaultColor(0,0,0,255):SetText("Salaire (K)"):SetPos(26,425)
	    local numberboxPersonnel3 = loveframes.Create("numberbox", panel4)
	    numberboxPersonnel3:SetPos(35, 460):SetSize(50,20):SetIncreaseAmount(1):SetDecreaseAmount(1):SetValue(Salary/100)
	    local clickablePersonnel3 = loveframes.Create("imagebutton", panel4)
	    clickablePersonnel3:SetImage("ressources/UiBtnFixed.png"):SetPos(110,430):SetText("Modifier les salaires"):SizeToImage()
	    clickablePersonnel3.OnClick = function(object)
	    	Salary = numberboxPersonnel3:GetValue() * 100
	    end
	    local infoBoxPersonnel3 = loveframes.Create("image", panel4)
	    infoBoxPersonnel3:SetImage("ressources/UiRackinfosBlock2.png"):SetScale(0.5,0.5):Center():SetY(500)
	    local textInfoBoxPersonnel3 = loveframes.Create("text", panel4)
	    textInfoBoxPersonnel3:SetText("Diminuez ou augmenter les salaires de vos employés, \net confirmez avec le bouton ci-dessus"):SetPos(45, 510)

    local panel5 = loveframes.Create("panel")
    tabsmenudown:AddTab("Publicité", panel5, "Publicité")

    	if not containerPublicite then
		    local containerPublicite = loveframes.Create("image", panel5)
		    containerPublicite:SetImage("ressources/UiRackMenuBlock.png"):SetScale(0.55,0.43):Center():SetY(10)
		    local titleContainerPublicite = loveframes.Create("text", panel5)
		    titleContainerPublicite:SetFont(cashtext):SetDefaultColor(23,23,23,255):SetText("Produits publicitaires"):Center():SetY(14)
		end

		local infoBoxPublicite = loveframes.Create("image", panel5)
	    infoBoxPublicite:SetImage("ressources/UiRackinfosBlock2.png"):SetScale(0.5,0.5):Center():SetY(130)
	    local infoBoxPubliciteText = loveframes.Create("text", panel5)
	    infoBoxPubliciteText:SetPos(45,132):SetText("Sélectionnez une campagne publicitaire")


		multichoicePublicite = loveframes.Create("multichoice", panel5)
		multichoicePublicite:SetPos(25,55):SetSize(250,40):AddChoice("Prospectus"):AddChoice("Presse"):AddChoice("Dons")
		if T_YEAR == 1920 then multichoicePublicite:AddChoice("Radio") end
		if T_YEAR == 1950 then multichoicePublicite:AddChoice("Cinema") end
		multichoicePublicite.OnChoiceSelected = function(object,choice)
			if choice == "Prospectus" then
				infoBoxPubliciteText:SetText("Payer des étudiants pour distribuer des prospectus\n\t- Prix : 8000F\n\t- Popularité : +DUNNO")
			elseif choice == "Presse" then
				infoBoxPubliciteText:SetText("Payer des journaux pour un placement publicitaire\n\t- Prix : 20000F\n\t- Popularité : +DUNNO")
			elseif choice == "Dons" then
				infoBoxPubliciteText:SetText("Faire un don de son capital à une association\n\t- Prix : 150000F\n\t- Popularité : +DUNNO")
			elseif choice == "Radio" then
				infoBoxPubliciteText:SetText("Payer des chaînes de radio pour un spot publicitaire\n\t- Prix : 50000F\n\t- Popularité : +DUNNO")
			elseif choice == "Cinema" then
				infoBoxPubliciteText:SetText("Payer les cinémas Français pour diffuser une publicité\n\t- Prix : 200000F\n\t- Popularité : +DUNNO")
			end
		end

		buttonPublicite = loveframes.Create("imagebutton", panel5)
		buttonPublicite:SetImage("ressources/UiBtnFixed2.png"):SizeToImage():SetText("Acheter"):SetPos(300,52)
		buttonPublicite.OnClick = function(object)
			if multichoicePublicite:GetChoice() == "Prospectus" then
				addMoney(-8000, "Campagne Pub.")
				engouement = engouement + 0.1
				reputation = reputation + 0.3
			elseif multichoicePublicite:GetChoice() == "Presse" then
				addMoney(-20000, "Campagne Pub.")
				engouement = engouement + 0.2
				reputation = reputation + 0.4
			elseif multichoicePublicite:GetChoice() == "Dons" then
				addMoney(-150000, "Campagne Pub.")
				engouement = engouement + 0.5
				reputation = reputation + 0.3
			elseif multichoicePublicite:GetChoice() == "Radio" then
				addMoney(-50000, "Campagne Pub.")
				engouement = engouement + 0.4
				reputation = reputation + 0.3
			elseif multichoicePublicite:GetChoice() == "Cinema" then
				addMoney(-200000, "Campagne Pub.")
				engouement = engouement + 0.5
				reputation = reputation + 0.5
			end
		end

end)
