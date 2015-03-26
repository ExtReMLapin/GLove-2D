
local img = love.graphics.newImage("ressources/maquette_v2.png")

hook.Add("BackBackGround", "The real one this time", function()
	draw.Wallpaper(img)
end)
