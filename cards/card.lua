local Object = require "lib.classic"

local Card = Object:extend()
local font = love.graphics.newFont("assets/SinsGold.ttf", 32)

function Card:new(count)
    self.count = count
    self.image = love.graphics.newImage("assets/cards/attack.png")
end

function Card:draw()
    love.graphics.push("all")
    love.graphics.draw(self.image)
    love.graphics.setFont(font)
    love.graphics.setColor(0.1, 0.1, 0.2)
    love.graphics.print("x" .. tostring(self.count), 8, 39)
    love.graphics.pop()
end

return Card
