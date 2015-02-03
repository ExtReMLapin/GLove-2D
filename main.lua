local loaded = {}
local i = 1
local http;
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
	include("json.lua")
	http = require("socket.http")
end

function love.load()
	loveframes = require("gui")
	load_modules()
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
end

function love.draw()
	loveframes.draw()

	hook.Call("Draw")
	for k, v in pairs(loaded) do
		love.graphics.print(v, 42, 42+(30*k))
	end
	
end



function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	loveframes.keyreleased(key)
end

function love.textinput(text) 
	loveframes.textinput(text)
end
