function investMenu()
	love.graphics.setColor(255,255,255)
	love.graphics.print("Investir", 30, 50)

	love.graphics.setColor(104,102,102)
	love.graphics.rectangle("fill", 30, 90, 550, 540)
	love.graphics.rectangle("fill", 610, 90, 540, 270)

	love.graphics.setColor(48,187,229)
	love.graphics.setFont(subtitle)
	love.graphics.print("Détails :", 615, 92)
end