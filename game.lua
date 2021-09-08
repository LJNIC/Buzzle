local Plan = require "lib.plan"
local Level = require "level"

local game = {}
game.root = Plan.new()
local uiImage = love.graphics.newImage("assets/UI.png")
local scale = 4

function game:enter()
    self.level = Level("levels.level1")
end

function game:update(dt)
end

function game:draw()
    self.level:draw()


    love.graphics.push()
        love.graphics.scale(scale, scale)
        love.graphics.draw(self.level.canvas, 48)
    love.graphics.pop()
    love.graphics.push()
        love.graphics.scale(scale, scale)
        love.graphics.draw(uiImage)
    love.graphics.pop()
end

return game
