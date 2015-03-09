username = "Testguy"
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