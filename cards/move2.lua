local Card = require "cards.card"

local Move2 = Card:extend()
Move2.targets = {Vec2(2, 0), Vec2(0, 2), Vec2(-2, 0), Vec2(0, -2)}

function Move2:new(count)
    local card = Move2.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move2.png")
    return card
end

return Move2
