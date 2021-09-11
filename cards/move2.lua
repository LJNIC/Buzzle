local Card = require "cards.card"

local Move2 = Card:extend()

function Move2:new(count)
    Move2.super.new(self, count)
    self.image = love.graphics.newImage("assets/cards/move2.png")
end

return Move2
