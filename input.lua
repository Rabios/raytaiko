-- Input logic,Loaded by game.lua
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
			misses = misses + 1
		    else
			if not level[current_circle] == 0 then
			    status.text = "MISS"
			     status.color = rl.RED
			     table.insert(hits, false)
			     rl.PlaySound(config.resources.miss_sound)
			     misses = misses + 1
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
				misses = misses + 1
			else
			    if not level[current_circle] == 0 then
			         status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
					 misses = misses + 1
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
				misses = misses + 1
			else
			    if not level[current_circle] == 0 then
			         status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
					 misses = misses + 1
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
				misses = misses + 1
			else
			    if not level[current_circle] == 0 then
			         status.text = "MISS"
				     status.color = rl.RED
			         table.insert(hits, false)
					 rl.PlaySound(config.resources.miss_sound)
					 misses = misses + 1
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
