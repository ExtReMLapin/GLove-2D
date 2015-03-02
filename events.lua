require("modules/hook")

Event = {}
Event[1] = {}
Event[1].date = string.format("%i%i", 5, 1852)
Event[1].func = function() print("yo mate, may the 4th be with you") end

PassedEvents = PassedEvents or {}


hook.Add("DateChange", "EventDateChange", function()

	for k, v in pairs(Event) do
		if PassedEvents[k] then return end
		if v.date == string.format("%i%i", T_MONTH, T_YEAR)	then
			v.func()
			PassedEvents[k] = true;
		end
	end
	
end)

