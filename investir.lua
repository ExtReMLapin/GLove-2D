function investirMenu()
	menuInvestir = loveframes.Create("image")
	menuInvestir:SetImage("ressources/investirmenu.png")
	menuInvestir:Center()
	investirChoice = loveframes.Create("form", menuInvestir)
	investirChoice:SetPos(220,130)
	for k, v in pairs(Sectors) do
		investirChoice:AddChoice(v)
	end
end