if hook then return false end

hook = {}
hook.hooks = {}

function __genOrderedIndex( t )
	local orderedIndex = {}
	for key in pairs(t) do
		table.insert( orderedIndex, key )
	end
	table.sort( orderedIndex )
	return orderedIndex
end

function orderedNext(t, state)
	if state == nil then
		t.__orderedIndex = __genOrderedIndex( t )
		key = t.__orderedIndex[1]
		return key, t[key]
	end
	key = nil
	for i = 1,table.getn(t.__orderedIndex) do
		if t.__orderedIndex[i] == state then
			key = t.__orderedIndex[i+1]
		end
	end
	if key then
		return key, t[key]
	end
	t.__orderedIndex = nil
	return
end

function orderedPairs(t)
	return orderedNext, t, nil
end

function hook.Call(t, ...)
	if hook.hooks[t] then
		for k, v in orderedPairs(hook.hooks[t]) do
			if type(v) == "function" then
				v(...)
			end
		end
	end
end

function hook.Add(t, key, func)
	if not hook.hooks[t] then
		hook.hooks[t] = {}
	end

	hook.hooks[t][key] = func
end

function hook.Remove(t, key)
	if hook.hooks[t] and hook.hooks[t][key] then
		hook.hooks[t][key] = nil
	end
end