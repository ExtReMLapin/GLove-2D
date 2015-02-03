local loaded = {}
local i = 1


Msg = io.write;

function isfunction(a)
	return type(a) == "function"
	--return true
end

function isstring(a)
	return type(a) == "string"
	--return true
end

function isnumber(a)
	return type(a) == "number"
end


function include(file)
	return require(string.gsub(file, ".lua", ""))
end


function load_modules()
    local files =  love.filesystem.getDirectoryItems("modules")
    for i,v in ipairs(files) do
		include("modules/" .. v)
		loaded[i] = v
		i = i + 1;
    end

end


function fuckoff()
	print(42);

end

function love.load()
	
	--debug.debug() -- open the lua console
	load_modules()
	hook.Add("Think", "telst", fuckoff)
end


function love.draw()
	hook.Call("Draw")
	for k, v in pairs(loaded) do
		love.graphics.print(v, 42, 42+(30*k))
	end
end


function love.update()
	hook.Call("Think")
end





function love.keypressed(k) end
function love.keyreleased(k) end
function love.mousepressed(x, y, b) end
function love.mousereleased(x, y, b) end