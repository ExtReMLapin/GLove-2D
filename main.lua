local loaded = {}
local i = 1

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


function love.load()
	load_modules()
end

function love.draw()
	--hook.Call("Draw")
	for k, v in pairs(loaded) do
		love.graphics.print(v, 42, 42+(30*k))
	end


	
end





function love.update(dt) end

function love.keypressed(k) end
function love.keyreleased(k) end
function love.mousepressed(x, y, b) end
function love.mousereleased(x, y, b) end
