require("modules/hook")


local cash = love.audio.newSource("ressources/cash.ogg", "static")


cash:setVolume(0.3) -- 90% of ordinary volume
cash:setPitch(1) -- one octave lower





function addMoney(num, reason)
	if num == 0 then return end
	Money = Money + num
	hook.Call("MoneyAdd", nil, num, reason or "Dépenses")
	cash:play()
end

hook.Add("MoneyAdd", "AutoSafeOnMoneyChange", function()
	if math.random(7) == 5 then 
		do_save_data()
	end
end)