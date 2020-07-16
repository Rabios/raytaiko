-- Written by Rabia Alhaffar in 16/July/2020
-- Main Taiko engine file
setmetatable(_G, { __index = rl })
author = "Rabia Alhaffar"
version = "v0.0.1"

-- Load configurations and taiko game
dofile("config.lua")
dofile("game.lua")