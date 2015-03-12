timer = {}

local PAUSED = -1
local STOPPED = 0
local RUNNING = 1

local timerList = {}
local timerListSimple = {}

local function createTimer( name )

	if ( timerList[name] == nil ) then
		timerList[name] = {}
		timerList[name].Status = STOPPED
		return true
	end

	return false

end

function timer.exists( name )

	return timerList[name] ~= nil

end

function timer.create( name, delay, reps, func, ... )

	if ( timer.exists( name ) ) then
		timer.remove( name )
	end

	timer.adjust( name, delay, reps, func, ... )
	timer.start( name )

end

function timer.start( name )

	if ( not timer.exists( name ) ) then return false end
	timerList[name].n = 0
	timerList[name].Status = RUNNING
	timerList[name].Last = love.timer.getTime()
	return true
	
end

function timer.adjust( name, delay, reps, func, ... )
	
	local args = {...}
	
	createTimer( name )
	timerList[name].Delay = delay
	timerList[name].Repetitions = reps
	if ( func ~= nil ) then 
		timerList[name].Func = func
		timerList[name].Args = args
	end
	
	return true
	
end


function timer.pause( name )

	if ( not timer.exists( name ) ) then return false; end
	if ( timerList[name].Status == RUNNING ) then
		timerList[name].Diff = love.timer.getTime() - timerList[name].Last
		timerList[name].Status = PAUSED
		return true
	end
	return false
	
end

function timer.unPause( name )

	if ( not timer.exists( name ) ) then return false; end
	if ( timerList[name].Status == PAUSED ) then
		timerList[name].Diff = nil
		timerList[name].Status = RUNNING
		return true
	end
	return false
	
end

-- toggle pause
function timer.toggle( name )

	if ( timer.exists( name ) ) then
		if ( timerList[name].Status == PAUSED ) then
			return timer.unPause( name )
		elseif ( timerList[name].Status == RUNNING ) then
			return timer.pause( name )
		end
	end
	return false
	
end

function timer.stop( name )

	if ( not timer.exists( name ) ) then return false; end
	if ( timerList[name].Status ~= STOPPED ) then
		timerList[name].Status = STOPPED
		return true
	end
	return false
	
end

-- check all timers
function timer.check()

	for key, value in pairs( timerList ) do
	
		if ( value.Status == PAUSED ) then
		
			value.Last = love.timer.getTime() - value.Diff
			
		elseif ( value.Status == RUNNING and ( value.Last + value.Delay ) <= love.timer.getTime() ) then
				
			value.Last = love.timer.getTime()
			value.n = value.n + 1 
			
			if ( value.n >= value.Repetitions and value.Repetitions ~= 0) then
				Stop( key )
			end

			value.Func(unpack(value.Args))
				
		end
		
	end
	
	-- Run Simple timers
	for key, value in pairs( timerListSimple ) do

		if ( value.Finish <= love.timer.getTime() ) then
			
			table.remove( timerListSimple, key )
			value.Func(unpack(value.Args))
			
		end
	end
	
end

function timer.remove( name )

	timerList[ name ] = nil
	
end

function timer.simple( delay, func, ... )

	local new_timer = {}
	
	new_timer.Finish = love.timer.getTime() + delay
	new_timer.Func = func
	new_timer.Args = {...}
	
	table.insert( timerListSimple, new_timer )
	
	return true
	
end



timer.Simple = timer.simple
timer.Remove = timer.remove
timer.UnPause = timer.unPause
timer.Pause = timer.pause