local Card = require "cards.card"

local Move1 = Card:extend()

function Move1:new(count)
    Move1.super.new(self, count)
    self.image = love.graphics.newImage("assets/cards/move1.png")
end

return Move1
