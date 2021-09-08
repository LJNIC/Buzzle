function love.load()
    require("lib.batteries"):export()
    roomy = require("lib.roomy").new()
    Vec2 = require "lib.vec2"
    TILE_WIDTH = 16
    love.graphics.setDefaultFilter("nearest", "nearest")
    roomy:hook()
    roomy:enter(require "game")
end

