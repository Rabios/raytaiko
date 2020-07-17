-- Utilities
function level_finished()
    return circles_positions[#circles_positions][1] < -180
end

function song_finished()
    if not config.resources.song then
	    return rl.IsMusicPlaying(config.resources.song) == false
	end
end

function readlevel(circles)
	circles_positions = {}
	hits = {}
    score = 0
	timer = 0
	misses = 0
    combo = 1
	current_circle = 1
    for i = 1, #circles, 1 do
	    table.insert(circles_positions, { i * config.circles.margin, config.options.height - (config.circles.size * 2) })
	end
end