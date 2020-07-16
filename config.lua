-- Written by Rabia Alhaffar in 16/July/2020
-- raytaiko config file

load_directory = "resources"

config = {
    options = {
	    width = 800,
		height = 600,
		title = "TAIKO",
        vsync = true,
	    antialiasing = false,
	    highdpi = true,
		dev = true,
		
		background_color = rl.BLACK -- Background color
	},
	
	-- Controls
	keys = {
	    up = rl.KEY_UP,
		down = rl.KEY_DOWN,
		left = rl.KEY_LEFT,
		right = rl.KEY_RIGHT
	},
	
	resources = {
	    hit_sound = rl.LoadSound(load_directory.."/13909__adcbicycle__5.wav"),
		miss_sound = rl.LoadSound(load_directory.."/515625__mrickey13__throw-swipe.wav"),
		background_image = nil, -- Use rl.LoadTexture(src)
		song = nil, -- Use rl.LoadMusicStream(src)
		
		-- Use rl.LoadTexture(src) for each one
		up = nil,
		down = nil,
		left = nil,
		right = nil
	},
	
	circles = {
	    first_color = rl.RED,
		second_color = rl.BLUE,
		third_color = rl.GREEN,
		fourth_color = rl.PURPLE,
		size = 50,
		margin = 2,
		speed = 6,
	},
	
	level = nil,
	hit_score = 100
}