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
		background_color = rl.BLACK -- Background color
	},
	
	-- Controls
	keys = {
	    up = rl.KEY_UP,
		down = rl.KEY_DOWN,
		left = rl.KEY_LEFT,
		right = rl.KEY_RIGHT
	},
	
	circles = {
	    first_color = rl.RED,
		second_color = rl.BLUE,
		third_color = rl.GREEN,
		fourth_color = rl.PURPLE,
		size = 50,
		margin = 200, -- Distance x between each circle
		speed = 10,
	},
	
	-- Array consists of 0s, 1s, 2s, 3s,Or even 4s
	level = nil,
	hit_score = 100
}