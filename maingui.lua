username = "Testguy"
usrlevel = 3
account_growth = 34
virtual_account_money = 2500
local principalMenuX = 0
local principalMenuY = 0
RightClickMENU = false
IsOnDesktop = true
IsInRightClickMenu = false
Brand = {}
	Brand[1] = {}
	Brand[2] = {}
	Brand[3] = {}
	Brand[4] = {}
	Brand[5] = {}
	Brand[6] = {}
	Brand[7] = {}
	Brand[8] = {}

	Brand[1].Name = "AMD"
	Brand[1].rn = "AMD"
	Brand[2].Name = "NVIDIA"
	Brand[2].rn = "NVDA"
	Brand[3].Name = "INTEL"
	Brand[3].rn = "INTC"
	Brand[4].Name = "Netflix"
	Brand[4].rn = "NFLX"
	Brand[5].Name = "Apple"
	Brand[5].rn = "AAPL"
	Brand[6].Name = "Facebook"
	Brand[6].rn = "Facebook"
	Brand[7].Name = "Microsoft"
	Brand[7].rn = "MSFT"
	Brand[8].Name = "Google"
	Brand[8].rn = "GOOGL"

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
		RightClickMENU1 = loveframes.Create("panel")
		RightClickMENU1:SetPos(realX-50,realY-200)
		RightClickMENU1.OnMouseEnter = function(object)
			IsInRightClickMenu = true
		end
		RightClickMENU1.OnMouseExit = function(object)
			IsInRightClickMenu = false

		end
		    local text1 = loveframes.Create("text", RightClickMENU1)
			    text1:SetPos(14, 10)
			    text1:SetFont(subtitle)
			    text1:SetLinksEnabled(false)
			    text1:SetText("Investir")
				text1.OnMouseEnter = function(object)
					IsInRightClickMenu = true

				end
				text1.OnMouseExit = function(object)
					IsInRightClickMenu = true
				end
---------------------------------------------------------------------------
		RightClickMENU2 = loveframes.Create("panel")
		RightClickMENU2:SetPos(realX-50,realY-140)
		RightClickMENU2.OnMouseEnter = function(object)
			IsInRightClickMenu = true
		end
		RightClickMENU2.OnMouseExit = function(object)
			IsInRightClickMenu = false
		end

		    local text2 = loveframes.Create("text", RightClickMENU2)
			    text2:SetPos(14, 10)
			    text2:SetFont(subtitle)
			    text2:SetLinksEnabled(false)
			    text2:SetText("Se former")
				text2.OnMouseEnter = function(object)
					IsInRightClickMenu = true
				end
				text2.OnMouseExit = function(object)
					IsInRightClickMenu = true
				end

<<<<<<< HEAD
function principalMenu(realX,realY)
	local gamestate1;
	if principalMenuX == 0 and principalMenuY == 0 then
		principalMenuX = realX
		principalMenuY = realY
		menuPrincip = loveframes.Create("image")
		menuPrincip:SetImage("ressources/menubar.png")
		menuPrincip:SetPos(realX,realY)
	elseif principalMenuX ~= 0 and principalMenuY ~= 0 then
		if (realX < principalMenuX or realX > principalMenuX + 210) or (realY < principalMenuY or realY > principalMenuY + 146) and _gamestate == "playing" then
			principalMenuY = 0
			principalMenuX = 0
			menuPrincip:Remove()			
=======
---------------------------------------------------------------------------
		RightClickMENU3 = loveframes.Create("panel")
		RightClickMENU3:SetPos(realX-50,realY-80)
		RightClickMENU3.OnMouseEnter = function(object)
			IsInRightClickMenu = true
>>>>>>> origin/2nd-branch
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
	end
end

function seformerMenu(realX,realY)
	menuFormer = loveframes.Create("image")
	menuFormer:SetImage("ressources/formerbar.png")
	menuFormer:SetPos(principalMenuX + 212,principalMenuY)
end

function investirMenu()
	menuInvestir = loveframes.Create("image")
	menuInvestir:SetImage("ressources/investirmenu.png")
	menuInvestir:Center()
	investirChoice = loveframes.Create("multichoice", menuInvestir)
	investirChoice:SetPos(220,130)
	for k, v in pairs(Brand) do
		investirChoice:AddChoice(v.Name)
	end
end