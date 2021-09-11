local Plan = require "lib.plan"
local Rules = Plan.Rules
local Container = Plan.Container
local Level = require "level"

local game = {}
local uiImage = love.graphics.newImage("assets/UI.png")
local interfaceScale = 4
local gameScale = 2

function game:enter()
    self.level = Level("levels.level1")
end

function game:update(dt)
end

function game:draw()
    self.level:draw()
    love.graphics.setBackgroundColor(29/255, 16/255, 28/255)

    love.graphics.push()
        love.graphics.draw(self.level.canvas, love.graphics.getWidth()/2, love.graphics.getHeight()/3, 0, gameScale, gameScale, self.level.canvas:getWidth()/2, self.level.canvas:getHeight()/2)
    love.graphics.pop()
    love.graphics.push()
        love.graphics.scale(interfaceScale, interfaceScale)
        love.graphics.draw(uiImage)
        self.level.deck:draw()
    love.graphics.pop()
end

function game:keypressed(key)
    if key == "right" then
        gameScale = gameScale + 1
    elseif key == "left" then
        gameScale = gameScale - 1
    end
end

return game
