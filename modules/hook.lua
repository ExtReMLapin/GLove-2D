module( "hook", package.seeall )
require"modules/util"
local Hooks = {}

function GetTable() return Hooks end

function Add( event_name, name, func )

	if (not isfunction( func ) ) then return end
	if (not isstring( event_name ) ) then return end

	if (Hooks[ event_name ] == nil) then
			Hooks[ event_name ] = {}
	end

	Hooks[ event_name ][ name ] = func

end

function Remove( event_name, name )

	if (  not isstring( event_name ) ) then return end
	if (  not Hooks[ event_name ] ) then return end

	Hooks[ event_name ][ name ] = nil

end

function Call( name, ... )
	local HookTable = Hooks[ name ]
	if ( HookTable ~= nil ) then
	
		local a, b, c, d, e, f;

		for k, v in pairs( HookTable ) do 
			
			if ( isstring( k ) ) then
				a, b, c, d, e, f = v( ... )
			else
				if ( IsValid( k ) ) then

					a, b, c, d, e, f = v( k, ... )
				else
					HookTable[ k ] = nil
				end
			end
			if ( a ~= nil ) then
				return a, b, c, d, e, f
			end
				
		end
	end
end
