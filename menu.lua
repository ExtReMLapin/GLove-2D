button2 = {}
username = ""

function loggingDraw(username)
	if not usrbox then 
		usrbox = loveframes.Create("frame")
		usrbox:SetName("Please write your username")
		usrbox:Center()
		textinput = loveframes.Create("textinput")
		textinput:SetParent(usrbox)
		textinput:SetPlaceholderText(username)
		textinput:SetWidth(200)
		textinput:Center()
	end
end

function menuDraw()
	if not menubox then
		menubox = loveframes.Create("frame")
		menubox:SetName("Menu")
		menubox:Center()
	end
end

function mainGUI()
	love.graphics.setColor(38,38,44)
	love.graphics.rectangle("fill", 0, 670, 1280, 50)
	for i,v in ipairs(button2) do
		love.graphics.setColor(222,31,85)
		if gamestate == "playing.invest" and i == 1 then
			love.graphics.setColor(33,224,170)
		end
		if gamestate == "playing.account" and i == 2 then
			love.graphics.setColor(33,224,170)
		end
		if gamestate == "playing.help" and i == 3 then
			love.graphics.setColor(33,224,170)
		end
		love.graphics.setFont(title)
		love.graphics.print(v.text, v.x, v.y)
	end
end

function menuButton(x,y, text, id)
	table.insert(button2, {x = x, y = y, text = text, id = id})
end

function menuClick(x,y,mouse,key)
	for i,v in ipairs(button2) do
		if x > v.x and x < v.x + title:getWidth(v.text) and y > v.y and y < v.y + title:getHeight() then
			if v.id == "invest" then
				gamestate = "playing.invest"
				loveframes.util.RemoveAll()
				local image = loveframes.Create("image", frame)
				image:SetImage("ressources/image.jpg")
				image:SetPos(30, 90)
				investList()
				investBuyOrSell()
				investSliders()
			end
			if v.id == "account" then
				gamestate = "playing.account"
				loveframes.util.RemoveAll()
				accountBought()
			end
			if v.id == "help" then
				gamestate = "playing.help"
				loveframes.util.RemoveAll()
			end
		end
	end

end