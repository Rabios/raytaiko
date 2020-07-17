function load_resources()
    config.resources = {
        hit_sound = rl.LoadSound(load_directory.."/13909__adcbicycle__5.wav"),
	    miss_sound = rl.LoadSound(load_directory.."/515625__mrickey13__throw-swipe.wav"),
	    background_image = nil, -- Use rl.LoadTexture(src)
	    song = nil,             -- Use rl.LoadMusicStream(src)
		
	    -- Use rl.LoadTexture(src) for each one
	    up = nil,
		down = nil,
		left = nil,
		right = nil,
		
		-- For up, down, left, right images
		image_size = config.circles.size
    }
end