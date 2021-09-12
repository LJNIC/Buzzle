local Card = require "cards.card"
local utilities = require "utilities"

local Move2 = Card:extend()
Move2.targets = functional.map(utilities.directions, function(v) return v * 2 end)

function Move2:new(count)
    local card = Move2.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move2.png")
    card.id = "move2"
    return card
end

return Move2
