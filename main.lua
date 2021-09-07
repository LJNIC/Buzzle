require("lib.batteries"):export()
Vec2 = require "lib.vec2"
TILE_WIDTH = 16

local Level = require "level"
local level = Level("Levels.level1")

function love.draw()
    level.player:draw()
end
