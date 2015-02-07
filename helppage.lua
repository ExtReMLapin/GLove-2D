function helpPrincipal()
	local how2_playButton = loveframes.Create("button")
	how2_playButton:SetPos(540,150)
	how2_playButton:SetWidth(200)
	how2_playButton:SetText("Comment jouer ?")
	how2_playButton.OnClick = function(object, x, y)
		helpPlay()
	end

	local contactButton = loveframes.Create("button")
	contactButton:SetPos(540,300)
	contactButton:SetWidth(200)
	contactButton:SetHeight(60)
	contactButton:Center()
	contactButton:SetText("Contact")
	contactButton.OnClick = function(object, x, y)
		contactButton:SetText("pfichepo@student.42.fr\nfsacrepe@student.42.fr")
	end
end

function helpPlay()
	local how2_playFrame = loveframes.Create("frame")
	how2_playFrame:SetWidth(600)
	how2_playFrame:SetHeight(550)
	how2_playFrame:Center()
	how2_playFrame:SetName("Comment jouer ?")
	how2_playFrame:SetAlwaysOnTop()

	local how2_playText = loveframes.Create("text", how2_playFrame)
	how2_playText:SetPos(350,47)
	how2_playText:SetMaxWidth(595)
	how2_playText:SetText(" \tLe principe du jeu est très simple : investir ! \n\n \tVous recevez chaque jour une somme d'argent correspondant à l'argent que vous avez dans votre compte en banque réel (plafonné à 2500€) afin de pouvoir l'investir (virtuellement) dans une firme côtée en bourse.\n\n \tMenu ''Investir'' :\n\n \tCe menu va vous permettre de choisir intelligement la firme dans laquelle investir. Choisissez une firme grâce au menu déroulant , une fois choisie, la page de détails ainsi que le graphique des côtes vous aideront à faire le bon choix d'investissement. Une fois votre décision prise, il vous suffit de choisir le nombre d'actions à acheter et de cliquer sur le texte 'Acheter' (attention cependant, il vous faudra la somme nécessaire à l'achat de ces actions sur votre compte virtuel afin de procéder à la transaction)\n\n \tMenu ''Mon Compte'' :\n\n \tLe menu 'Mon Compte' (qui est aussi le menu principal) est un résumé de tout ce que vous devez savoir sur votre compte :\n \t- L'argent virtuel dans votre compte\n \t- La croissance financière de votre compte virtuel\n \t- La liste de vos actions\n\n \tCe menu contribue à la bonne gestion de vos ressources financières afin d'augmenter vos chances de gains\n\n \tMenu ''Aide'' :\n\n \tLe menu 'Aide' vous fournira toute l'aide dont vous aurrez besoin pour jouer et profiter pleinement de l'expérience de jeu offerte, vous pouvez aussi à partir de ce menu donner un feedback (positif ou négatif) pour nous permettre d'améliorer le jeu !" )
    how2_playText:CenterX()
end

function helpDraw()
	love.graphics.setFont(title)
	love.graphics.setColor(47,46,54)
	love.graphics.print("Aide", 30,50)
end


