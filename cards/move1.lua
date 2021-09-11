local Card = require "cards.card"

local Move1 = Card:extend()
Move1.targets = {Vec2(1, 0), Vec2(0, 1), Vec2(-1, 0), Vec2(0, -1)}

function Move1:new(count)
    local card = Move1.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move1.png")
    return card
end

function Move1:act(level, position)
    level.player:move(position)
end

return Move1
