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
			introBox = nil
			_gamestate = "playing"
		end
	end
end