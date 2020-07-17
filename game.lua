-- Taiko engine
-- Written by Rabia Alhaffar in 16/July/2020
ffi = require("ffi")
dofile("utils.lua")
dofile("config.lua")
dofile("draw.lua")
dofile("input.lua")
dofile("resources.lua")

-- Load a sample if there is no custom game level
if not config.level then
    -- 0 = No circle
	-- 1 = First color circle,Up key to hit
	-- 2 = Second color circle,Down key to hit
	-- 3 = Third color circle,Left key to hit
	-- 4 = Fourth color circle,Right key to hit
    level = { 0, 0, 0, 1, 2, 1, 1, 1, 0, 1, 2, 1, 1, 1, 0, 1, 2, 2, 2, 0, 2, 1, 1, 1, 3, 3, 4, 4, 3, 3, 4, 4, 2, 2 }
else
    level = config.level
end

score = 0
timer = 0
combo = 1
misses = 0
current_circle = 1
hits = {}

-- Status text
status = { text = "OKAY", color = rl.WHITE }

readlevel(level)

-- Game scene
function game()
    rl.BeginDrawing()
	draw()
	input()
    rl.EndDrawing()
	
    -- NOTES: Timer isn't used in the game,But can be useful to manipulate parts of the level
    timer = timer + 1
end

-- Create window with audio device initialization,And VSync enabled
if config.options.vsync then rl.SetConfigFlags(rl.FLAG_VSYNC_HINT) end
rl.InitWindow(config.options.width, config.options.height, config.options.title)
rl.InitAudioDevice()
load_resources()

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
if config.resources.up then rl.UnloadTexture(config.resources.up) end
if config.resources.down then rl.UnloadTexture(config.resources.down) end
if config.resources.left then rl.UnloadTexture(config.resources.left) end
if config.resources.right then rl.UnloadTexture(config.resources.right) end
if config.resources.background then rl.UnloadTexture(config.resources.background_image) end
if config.resources.song then rl.UnloadMusicStream(config.resources.song) end
rl.CloseAudioDevice()
rl.CloseWindow()
