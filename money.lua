require("modules/hook")

function addMoney(num, reason)
	if num == 0 then return end
	Money = Money + num
	hook.Call("MoneyAdd", nil, num, reason or "Dépenses")
end

hook.Add("MoneyAdd", "AutoSafeOnMoneyChange", function()
	if math.random(7) == 5 then 
		do_save_data()
	end
end)