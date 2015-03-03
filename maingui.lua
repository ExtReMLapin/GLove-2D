username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500
local principalMenuX = 0
local principalMenuY = 0
RightClickMENU = false
IsOnDesktop = true
IsInRightClickMenu = false

function playerInfos()
	love.graphics.setFont(subtitle)
	love.graphics.setColor(235,62,9)
	love.graphics.print(username .. " - Niveau : " .. usrlevel, 10, 10)
	love.graphics.setColor(0,0,0)
	love.graphics.print("Infos joueur :", 1000, 20)
	love.graphics.setFont(graphfont)
	love.graphics.print("Argent en compte : $" .. virtual_account_money, 1000, 70)
	love.graphics.print("Croissance : ", 1000, 100)
	if account_growth >= 0 then
		love.graphics.setColor(102,204,0)
	else
		love.graphics.setColor(204,0,0)
	end
	love.graphics.print(account_growth .. "%", 998 + graphfont:getWidth("Croissance : "), 100)
end


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
			IsInRightClickMenu = true
		end
		RightClickMENU1.OnMouseExit = function(object)
			IsInRightClickMenu = false

		end
		    local text1 = loveframes.Create("text", RightClickMENU1)
			    text1:SetPos(7, 10)
			    text1:SetFont(subtitle)
			    text1:SetLinksEnabled(false)
			    text1:SetText("Investir")
				text1.OnMouseEnter = function(object)
					IsInRightClickMenu = true

				end
				text1.OnMouseExit = function(object)
					IsInRightClickMenu = true
				end
				text1.OnClick = function(object)
					investirMenu()
				end
---------------------------------------------------------------------------------------
		RightClickMENU2 = loveframes.Create("panel")
		RightClickMENU2:SetPos(realX-50,realY-140)
		RightClickMENU2.OnMouseEnter = function(object)
			IsInRightClickMenu = true
		end
		RightClickMENU2.OnMouseExit = function(object)
			IsInRightClickMenu = false
		end

		    local text2 = loveframes.Create("text", RightClickMENU2)
			    text2:SetPos(7, 10)
			    text2:SetFont(subtitle)
			    text2:SetLinksEnabled(false)
			    text2:SetText("Se former")
				text2.OnMouseEnter = function(object)
					IsInRightClickMenu = true
				end
				text2.OnMouseExit = function(object)
					IsInRightClickMenu = true
				end
---------------------------------------------------------------------------------------
		RightClickMENU3 = loveframes.Create("panel")
		RightClickMENU3:SetPos(realX-50,realY-80)
		RightClickMENU3.OnMouseEnter = function(object)
			IsInRightClickMenu = true
		end
		RightClickMENU3.OnMouseExit = function(object)
			IsInRightClickMenu = false
		end

		    local text3 = loveframes.Create("text", RightClickMENU3)
			    text3:SetPos(7, 10)
			    text3:SetFont(subtitle)
			    text3:SetLinksEnabled(false)
			    text3:SetText("Liste des Actions")
				text3.OnMouseEnter = function(object)
					IsInRightClickMenu = true
				end
				text3.OnMouseExit = function(object)
					IsInRightClickMenu = true
				end




	else
		if IsInRightClickMenu then return end
		RightClickMENU1:Remove()
		RightClickMENU2:Remove()
		RightClickMENU3:Remove()
		RightClickMENU1= nil
		RightClickMENU3= nil
		RightClickMENU2= nil
		unpausetime()
	end
end

function seformerMenu(realX,realY)
	menuFormer = loveframes.Create("image")
	menuFormer:SetImage("ressources/formerbar.png")
	menuFormer:SetPos(principalMenuX + 212,principalMenuY)
end