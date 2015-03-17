-- 1sec    = 1/4 sem
-- 4 secs  = 1 sem
-- 16 secs = 1 mois
-- 3m12s   = 1 ans
-- 16 min  = 5 ans
-- 8 h     = 150 ans


require("modules/timer2")
require("modules/hook")

function unpausetime()
	timer.unPause("MainTimerDate")
end

function pausetime()
	timer.pause("MainTimerDate")
end

hook.Add("SaveRestored", "DATETIMERESTAURED", function()
	timer.create("MainTimerDate",1 , 0,
		function()
			T_DAY = T_DAY + 1
			if T_DAY > 4 then
				T_SEM = T_SEM + 1
				T_DAY = 1
			end
			if T_SEM > 4 then
				T_MONTH = T_MONTH + 1
				T_SEM = 1
			end
			if T_MONTH > 12 then
				T_YEAR = T_YEAR + 1
				T_MONTH = 1
			end
			hook.Call("DateChange")
		end 
	)
end)

function calculateDate(currentWeek,currentMonth,currentYear,nbDays)
	currentWeek = currentWeek + nbDays / 7
	if currentWeek > 4 then
		currentMonth = currentMonth + (currentWeek - currentWeek%4)/4
		currentWeek = currentWeek%4
		if currentWeek == 0 then currentWeek = 1 end
		if currentMonth > 12 then
			currentYear = currentYear + (currentMonth - currentMonth%12)/12
			currentMonth = currentMonth%12
		end
	end
	return currentWeek, currentMonth, currentYear
end
