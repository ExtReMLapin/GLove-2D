local loaded = {}
local i = 1
local http;
local json;
Msg = io.write;

function isfunction(a)
	return type(a) == "function"
end

function isstring(a)
	return type(a) == "string"
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
	http = require("socket.http")
	loveframes = require("gui")
end

function love.load()

	load_modules()
end


function love.update()
	loveframes.update(dt)
	hook.Call("Think")
end

function love.draw()
	loveframes.draw()
	hook.Call("Draw")
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
