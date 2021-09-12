local flux = require "lib.flux"
local Level = require "level"
local interface = require "interface"

local game = {}
local interfaceScale = 4
local gameScale = 2

function game:enter()
    self.level = Level("levels.level1")
    interface:enterLevel(self.level)
end

function game:update(dt)
    interface:update(dt)
    self.level:update(dt, game:getMouse())
    flux.update(dt) 
end

function game:getMouse()
    local x, y = love.mouse.getPosition()
    local width, height = love.graphics.getDimensions()
    x = (x - width / 2) / gameScale + self.level.canvas:getWidth() / 2
    y = (y - height / 3) / gameScale + self.level.canvas:getHeight() / 2
    return x, y
end

function game:draw()
    love.graphics.setBackgroundColor(29/255, 16/255, 28/255)

    local level = self.level
    level:draw()
    interface:draw()

    love.graphics.draw(level.canvas, love.graphics.getWidth()/2, love.graphics.getHeight()/3, 0, gameScale, gameScale, level.canvas:getWidth()/2, level.canvas:getHeight()/2)
    love.graphics.draw(interface.canvas, 0, 0, 0, interfaceScale, interfaceScale)
end

function game:keypressed(key)
    if key == "right" then
        gameScale = gameScale + 1
    elseif key == "left" then
        gameScale = gameScale - 1
    end
end

function game:mousepressed(x, y)
    interface:click(x, y)
end

return game
