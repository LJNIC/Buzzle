local Card = require "cards.card"

local Move3 = Card:extend()
Move3.targets = {Vec2(3, 0), Vec2(0, 3), Vec2(-3, 0), Vec2(0, -3)}

function Move3:new(count)
    local card = Move3.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move3.png")
    return card
end

return Move3
