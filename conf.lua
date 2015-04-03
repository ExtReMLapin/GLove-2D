function love.conf(t)
	t.version = "0.9.1"
	t.window.title = "SafeTrade v0.8"
	t.window.width = 1280
	t.window.height = 720
	t.window.resizable = true
	t.window.minwidth = 800
    t.window.minheight = 600  
	t.window.vsync = false
	t.window.fsaa = 0
	t.console = true 
	t.window.highdpi = false
	t.window.srgb = false
	if jit.os == "OSX" then t.window.highdpi = true end
end
