account_money = 2532

function accountInfos()
	local account_earnings = 324
	local account_growth = (account_earnings / account_money) * 100
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(title)
	love.graphics.print("Mon Compte ( " .. username .. " )", 30, 50)
	love.graphics.setFont(subtitle)
	love.graphics.print("Argent dans le compte : " .. account_money .. "€ / $" .. account_money * 1.1468, 30, 80)
	if account_growth > 0 then
		love.graphics.setColor(40,232,27)
		love.graphics.print("Croissance : +" .. account_growth .. "%", 30, 110)
	else
		love.graphics.setColor(235,12,12)
		love.graphics.print("Croissance : -" .. account_growth .. "%", 30, 110)
	end
	love.graphics.setColor(255,255,255)
end

