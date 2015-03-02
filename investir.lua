Sectors = {}
	Sectors[1] = "Banques"
	Sectors[2] = "Assurances"
	Sectors[3] = "Chemins de Fer"
	Sectors[4] = "Canaux"
	Sectors[5] = "Foncier et Immo."
	Sectors[6] = "Houillères"
	Sectors[7] = "Mines"
	Sectors[8] = "Forges"
	Sectors[9] = "Métaux"
	Sectors[10] = "Gaz"
	Sectors[11] = "Chimie"
	Sectors[12] = "Docks"
	Sectors[13] = "Eaux"
	Sectors[14] = "Navigation"
	Sectors[15] = "Filatures"
	Sectors[16] = "Transports"
	Sectors[17] = "Electricité"
	Sectors[18] = "Matériel"
	Sectors[19] = "Alimentation"
	Sectors[20] = "Constr. Navales"
	Sectors[21] = "Matériaux"
	Sectors[22] = "Constr. Mécaniques"
	Sectors[23] = "Imprimeries"
	Sectors[24] = "Magasins"

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