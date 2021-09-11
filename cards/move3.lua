local Card = require "cards.card"

local Move3 = Card:extend()

function Move3:new(count)
    Move3.super.new(self, count)
    self.image = love.graphics.newImage("assets/cards/move3.png")
end

return Move3
