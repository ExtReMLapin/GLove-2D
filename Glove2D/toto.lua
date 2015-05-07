--[[
Do not delete v

Documentation : 

CreatePopUp(title,text, choices, fun)
	Title -> Le titre de la box
	Text -> le texte à afficher, ne pas oublier les \n
	Choices, peut être soit une string, soit une table de string, maximum 5 string dans la table, une seul si on veut un bouton large ou NIL pour un "OK"
	fun, les fonctions à utiliser pour chaque bouton, #fun doit être égale à #choices

hook.Add(nom,uid,fonction)
	nom-> groupe dans laquelle la fonction sera appelée, ex : Think
	uid-> nom unique dans le groupe das lequelle elle est
	function -> la fonction en question qui doit être appelée, elle peut avoir des arguments, ils seront reçu automatiquement par la hook.Add (voir en dessous)

Hook.Add(nom, ...)
	nom-> le groupe que l'on utilise/crée, on peut très bien utiliser plusieurs hook.Call à la fois du même nom.
	... -> Les arguments à envoyer dans les fonction run par hook.Add("Think","UID", function(...) end)

createEvent(date, func)
	date -> doit être formaté de la facon suivante :  string.format("%i/%i/%i",3 , 11, 2015) (Semaine, Mois, Année)
	func -> la fonction sous forme de string ex: "gameEnd()"



You can edit below v


Nouveau système de popularité : 
	-Engouement : easy à modifier
	-Banque connue ou pas (ca peut que monter, pas descendre, sauf si les personnes meurent :v ), ca se fait via la pub
	-Banque appréciée ou pas, lent a modifier, peut aussi ne pas bouger si on fait pas trop grand chose

	-L'engouement ou la note de la banque ne peut être supérieur au fait que la banque soit connu.

	-Le tout est dépendant de l'apréciation.


	banque_connue -> 0 - 7 000 000 000 (inf)
	engouement -> 0-1
	appréciée -> 0-1


	Nouveaux clients = (banque_connue-clients_actuels)*(engouement*appréciée)/100

Nouvelle interface : 
	[DONE]Avec les menus en bas
	Menu échape

--]]