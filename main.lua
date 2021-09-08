local flux = require "lib.flux"
require("lib.batteries"):export()
Vec2 = require "lib.vec2"
TILE_WIDTH = 16

love.graphics.setDefaultFilter("nearest", "nearest")

local Level = require "level"
local level = Level("levels.level1")

function love.update(dt)
    flux.update(dt)
end

function love.draw()
    level:draw()
    love.graphics.push()
        love.graphics.scale(4, 4)
        love.graphics.draw(level.canvas, -16)
    love.graphics.pop()
end
