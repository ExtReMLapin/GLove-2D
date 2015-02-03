
--
-- Seed the rand!
--
math.randomseed( os.time() );

--
-- Alias string.Format to global Format
--
Format = string.format

--[[---------------------------------------------------------
	Prints a table to the console
-----------------------------------------------------------]]
function PrintTable( t, indent, done )

	done = done or {}
	indent = indent or 0
	local keys = table.GetKeys( t )

	table.sort( keys, function( a, b )
		if ( isnumber( a ) and isnumber( b ) ) then return a < b end
		return tostring( a ) < tostring( b )
	end )

	for i = 1, #keys do
		key = keys[ i ]
		value = t[ key ]
		Msg( string.rep( "\t", indent ) )

		if  ( istable( value ) and not done[ value ] ) then

			done[ value ] = true
			Msg( tostring( key ) .. ":" .. "\n" )
			PrintTable ( value, indent + 2, done )

		else

			Msg( tostring( key ) .. "\t=\t" )
			Msg( tostring( value ) .. "\n" )

		end

	end

end

--[[---------------------------------------------------------
	Convert Var to Bool
-----------------------------------------------------------]]
function tobool( val )
	if ( val == nil or val == false or val == 0 or val == "0" or val == "false" ) then return false end
	return true
end


--[[---------------------------------------------------------
	Given a number, returns the right 'th
-----------------------------------------------------------]]
local STNDRD_TBL = {"ere", "nde", "eme"}
function STNDRD( num )
	num = num % 100
	if ( num > 10 and num < 20 ) then
		return "eme"
	end

	return STNDRD_TBL[ num % 10 ] or "eme"
end

