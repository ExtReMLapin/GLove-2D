function tutorialText()
	if not introBox then
		introBox = loveframes.Create("image")
		introBox:SetImage("ressources/tutobox.png")
		introBox:Center()
		introButton = loveframes.Create("button")
		introButton:SetText("OK !")
		introButton:SetPos(640, 655 - 70)
		introButton.OnClick = function(object)
			introBox:Remove()
			introButton:Remove()
			gamestate = "playing"
		end
	end
end

function seFormer(x,y,button)
	gamestate = "formation"
	formerButton = loveframes.Create("image")
	formerButton:SetPos(menuX + 212 ,menuY)
	formerButton:SetImage("ressources/formerbutton.png")

	if x < menuX + 422 and x > menuX + 212 and y < menuY + 43 and y > menuY + 11 then
		formationRedirect(1)
	elseif x < menuX + 422 and x > menuX + 212 and y < menuY + 92 and y > menuY + 49 then
		formationRedirect(2)
	elseif x < menuX + 422 and x > menuX + 212 and y < menuY + 146 and y > menuY + 98 then
		formationRedirect(3)
	end
end

function formationRedirect(redirect)
	local text
	formerButton:Remove()
	if redirect == 2 then
		tinvestMultichoice = loveframes.Create("multichoice")
		tinvestText = loveframes.Create("text", tinvestMultichoice)
		tinvestText:SetPos(100,120)
		tinvestMultichoice:SetPos(100,100)
		tinvestMultichoice:AddChoice("Ordre à cours limité")
		tinvestMultichoice:AddChoice("Ordre à la meilleure limite")
		tinvestMultichoice:AddChoice("Ordre à seuil de déclenchement")
		tinvestMultichoice:AddChoice("Ordre au marché")
		tinvestMultichoice.OnChoiceSelected = function(choice)
			if choice == "Ordre à cours limité" then
				text = "Ordre le plus utilisé, il présente une bonne sécurité car il est assorti d'un prix maximal en cas d'achat ou un prix minimal en cas de vente."
			elseif choice == "Ordre à la meilleure limite" then
				text = "Cet ordre très peu sécurisant ne se justifie que pour des valeurs très liquides que l'on veut acquérir ou vendre rapidement."
			elseif choice == "Ordre à seuil de déclenchement" then
				text = "Fonctionnant à l'inverse de l'ordre à cours limité, il ne devient valable que si le cours d'une valeur franchit le niveau déterminé dans l'ordre. Pour un achat si le cours de la valeur franchit un seuil à la hausse et réciproquement à la vente."
			else if choice == "Ordre au marché" then
				text = "On ne précise pas de prix pour cet ordre et son exécution ne peut être que totale (pas de fragmentation des ordres). En contrepartie il est prioritaire sur tous les autres types d'ordres."
			end
		end
		tinvestText:SetText(text)
	end
end
end