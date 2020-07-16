-- Taiko engine
-- Written by Rabia Alhaffar in 16/July/2020
dofile("config.lua")

-- Load a sample if there is no custom game level
if type(config.level) == "nil" then
    -- 0 = No circle
	-- 1 = First color circle,Up key to hit
	-- 2 = Second color circle,Down key to hit
	-- 3 = Third color circle,Left key to hit
	-- 4 = Fourth color circle,Right key to hit
    level = { 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 0, 2, 3, 1, 4, 1, 3, 3, 2, 4, 1, 4, 2, 3, 1, 4, 1, 2, 3, 3, 2, 4, 2 }
else
    level = config.level
end

score = 0
combo = 1
current_circle = 1
hits = {}

-- Status text
status = { text = "OKAY", color = rl.WHITE }

-- Create positions for circles in the sample
function readlevel(circles)
	circles_positions = {}
	hits = {}
    score = 0
    combo = 1
	current_circle = 1
    for i = 1, #circles, 1 do
	    table.insert(circles_positions, { i * config.circles.margin * 100, config.options.height - (config.circles.size * 2) })
	end
end

function level_finished()
    return circles_positions[#circles_positions][1] < -180
end

function song_finished()
    if config.resources.song ~= nil then
	    return rl.IsMusicPlaying(config.resources.song) == false
	end
end

function drawlevel(positions)
    for i in ipairs(positions) do
	    -- Check which color or direction
	    if level[i] == 1 then
		    if type(config.resources.up) == "nil" then
		        rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.first_color)
		    else
			    rl.DrawTexture(config.resources.up, positions[i][1], positions[i][2], rl.WHITE)
			end
		elseif level[i] == 2 then
		   if type(config.resources.down) == "nil" then
		       rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.second_color)
		   else
		       rl.DrawTexture(config.resources.down, positions[i][1], positions[i][2], rl.WHITE)
           end			 
		elseif level[i] == 3 then
		    if type(config.resources.left) == "nil" then
		        rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.third_color)
		    else
			    rl.DrawTexture(config.resources.left, positions[i][1], positions[i][2], rl.WHITE)
			end
		elseif level[i] == 4 then
		    if type(config.resources.right) == "nil" then
		        rl.DrawCircle(positions[i][1], positions[i][2], config.circles.size, config.circles.fourth_color)
		    else
			    rl.DrawTexture(config.resources.right, positions[i][1], positions[i][2], rl.WHITE)
			end
		end
	-- Move them
	positions[i][1] = positions[i][1] - config.circles.speed
	end
end

function input()
        -- If up arrow key pressed and circle is red and not very far and not very near
		-- Increase combo and score,And set status to not negative
		-- And play hit sound
		-- Else,Reset combo and set status to negative
		if rl.IsKeyPressed(config.keys.up) then
		    if level[current_circle] == 1 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    score = score + (config.hit_score * combo)
				combo = combo + 1
				status.text = "GOOD"
				status.color = rl.GREEN
				table.insert(hits, true)
				rl.PlaySound(config.resources.hit_sound)
			elseif level[current_circle] ~= 1 and level[current_circle] ~= 0 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    status.text = "MISS"
				status.color = rl.RED
				table.insert(hits, false)
				rl.PlaySound(config.resources.miss_sound)
			else
			    if not level[current_circle] == 0 then
				     status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
				end
			end
			
		-- Else if down arrow key pressed and circle is blue and not very far and not very near
		-- Increase combo and score,And set status to not negative
		-- And play hit sound
		-- Else,Reset combo and set status to negative
		elseif rl.IsKeyPressed(config.keys.down) then
		    if level[current_circle] == 2 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    score = score + (config.hit_score * combo)
				combo = combo + 1
				status.text = "GOOD"
				status.color = rl.GREEN
				table.insert(hits, true)
				rl.PlaySound(config.resources.hit_sound)
			elseif level[current_circle] ~= 2 and level[current_circle] ~= 0 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    status.text = "MISS"
				status.color = rl.RED
				table.insert(hits, false)
				rl.PlaySound(config.resources.miss_sound)
			else
			    if not level[current_circle] == 0 then
			         status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
				end
			end
			
		elseif rl.IsKeyPressed(config.keys.left) then
		    if level[current_circle] == 3 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    score = score + (config.hit_score * combo)
				combo = combo + 1
				status.text = "GOOD"
				status.color = rl.GREEN
				table.insert(hits, true)
				rl.PlaySound(config.resources.hit_sound)
			elseif level[current_circle] ~= 3 and level[current_circle] ~= 0 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    status.text = "MISS"
				status.color = rl.RED
				table.insert(hits, false)
				rl.PlaySound(config.resources.miss_sound)
			else
			    if not level[current_circle] == 0 then
			         status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
				end
			end
		
		elseif rl.IsKeyPressed(config.keys.right) then
		    if level[current_circle] == 4 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    score = score + (config.hit_score * combo)
				combo = combo + 1
				status.text = "GOOD"
				status.color = rl.GREEN
				table.insert(hits, true)
				rl.PlaySound(config.resources.hit_sound)
			elseif level[current_circle] ~= 4 and level[current_circle] ~= 0 and not (circles_positions[current_circle][1] < -120 and circles_positions[current_circle][1] <= 0) then
			    status.text = "MISS"
				status.color = rl.RED
				table.insert(hits, false)
				rl.PlaySound(config.resources.miss_sound)
			else
			    if not level[current_circle] == 0 then
			         status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
				end
			end
		end
		
		-- When circle pass,Change current circle to check input with
		if circles_positions[current_circle][1] < -120 then
		    if level[current_circle] ~= 0 and not hits[#hits] then
			    combo = 1
			end
		    current_circle = current_circle + 1
		end
end

function draw()
    -- Clear
    rl.ClearBackground(config.options.background_color)
	
	if type(config.resources.background_image) ~= "nil" then
	    rl.DrawTexture(config.resources.background_image, 0, 0, rl.WHITE)
	end
	
	if type(config.resources.song) ~= "nil" and not rl.IsMusicPlaying(config.resources.song) then
	    rl.PlayMusicStream(config.resources.song)
	end
	
    -- Draw line,Game states,And game circles
	rl.DrawLine(config.circles.size * 2, 0, config.circles.size * 2, config.options.height, rl.WHITE)
	rl.DrawText(string.format("SCORE: %i", score), config.options.width - 220, 20, 32, rl.WHITE)
	rl.DrawText(string.format("COMBO: %i", combo), config.options.width - 220, 60, 32, rl.WHITE)
	rl.DrawText(status.text, config.options.width - 500, config.options.height - 400, 64, status.color)
	rl.DrawCircleLines(config.circles.size, config.options.height - config.circles.size, config.circles.size, rl.WHITE)
	drawlevel(circles_positions)
end

readlevel(level)

-- Game scene
function game()
    rl.BeginDrawing()
	    draw()
		input()
	rl.EndDrawing()
end

-- Create window with audio device initialization
if config.options.vsync then rl.SetConfigFlags(rl.FLAG_VSYNC_HINT) end
rl.InitWindow(config.options.width, config.options.height, config.options.title)
rl.InitAudioDevice()

if config.options.highdpi then
    rl.SetTextureFilter(rl.GetFontDefault().texture, rl.FILTER_POINT) -- Fix for HighDPI display problems
end

-- Game loop
while not rl.WindowShouldClose() do
    game()
end

-- Close window and audio device if window should close
rl.UnloadSound(config.resources.hit_sound)
rl.UnloadSound(config.resources.miss_sound)
if type(config.resources.up) ~= "nil" then rl.UnloadTexture(config.resources.up) end
if type(config.resources.down) ~= "nil" then rl.UnloadTexture(config.resources.down) end
if type(config.resources.left) ~= "nil" then rl.UnloadTexture(config.resources.left) end
if type(config.resources.right) ~= "nil" then rl.UnloadTexture(config.resources.right) end
if type(config.resources.background) ~= "nil" then rl.UnloadTexture(config.resources.background_image) end
if type(config.resources.song) ~= "nil" then rl.UnloadMusicStream(config.resources.song) end
rl.CloseAudioDevice()
rl.CloseWindow()