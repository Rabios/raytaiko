-- Taiko engine
-- Written by Rabia Alhaffar in 16/July/2020
dofile("config.lua")
dofile("utils.lua")
dofile("draw.lua")
dofile("input.lua")

-- Load a sample if there is no custom game level
if type(config.level) == "nil" then
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
