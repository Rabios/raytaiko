-- Draw graphics part, Loaded by game.lua
-- Draw level content
function drawlevel(positions)
    for i in ipairs(positions) do
	    -- Check which color or direction
	    if level[i] == 1 then
		    if not config.resources.up then
		        rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.first_color)
		    else
			    rl.DrawTexturePro(config.resources.up, ffi.new("Rectangle", 0, 0, config.resources.up.width, config.resources.up.height), ffi.new("Rectangle", positions[i][1], positions[i][2], config.resources.images_size, config.resources.images_size), ffi.new("Vector2", 0, 0), 0, rl.WHITE)
			end
		elseif level[i] == 2 then
		   if not config.resources.down then
		       rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.second_color)
		   else
		       rl.DrawTexturePro(config.resources.down, ffi.new("Rectangle", 0, 0, config.resources.down.width, config.resources.down.height), ffi.new("Rectangle", positions[i][1], positions[i][2], config.resources.images_size, config.resources.images_size), ffi.new("Vector2", 0, 0), 0, rl.WHITE)
           end			 
		elseif level[i] == 3 then
		    if not config.resources.left then
		        rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.third_color)
		    else
			    rl.DrawTexturePro(config.resources.left, ffi.new("Rectangle", 0, 0, config.resources.left.width, config.resources.left.height), ffi.new("Rectangle", positions[i][1], positions[i][2], config.resources.images_size, config.resources.images_size), ffi.new("Vector2", 0, 0), 0, rl.WHITE)
			end
		elseif level[i] == 4 then
		    if not config.resources.right then
		        rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.fourth_color)
		    else
			    rl.DrawTexturePro(config.resources.right, ffi.new("Rectangle", 0, 0, config.resources.right.width, config.resources.right.height), ffi.new("Rectangle", positions[i][1], positions[i][2], config.resources.images_size, config.resources.images_size), ffi.new("Vector2", 0, 0), 0, rl.WHITE)
			end
		end
	-- Move them
	positions[i][1] = positions[i][1] - config.circles.speed
	end
end

-- Draw line,Info,And content
function draw()
    -- Clear
    rl.ClearBackground(config.options.background_color)
	
	if config.resources.background_image then
	    rl.DrawTexturePro(config.resources.background_image, ffi.new("Rectangle", 0, 0, config.resources.background_image.width, config.resources.background_image.height), ffi.new("Rectangle", 0, 0, config.options.width, config.options.height), ffi.new("Vector2", 0, 0), 0, rl.WHITE)
	end
	
	if config.resources.song and not rl.IsMusicPlaying(config.resources.song) then
	    rl.PlayMusicStream(config.resources.song)
	end
	
    -- Draw line,Game states,And game circles
	rl.DrawLine(config.circles.size * 2, 0, config.circles.size * 2, config.options.height, rl.WHITE)
	rl.DrawText(string.format("SCORE: %i", score), config.options.width - 280, 20, 32, rl.WHITE)
	rl.DrawText(string.format("COMBO: %i", combo), config.options.width - 280, 60, 32, rl.WHITE)
	rl.DrawText(status.text, config.options.width - 500, config.options.height - 400, 64, status.color)
	rl.DrawCircleLines(config.circles.size , config.options.height - (config.circles.size * 2), config.circles.size, rl.WHITE)
	drawlevel(circles_positions)
end