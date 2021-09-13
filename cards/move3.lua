local Card = require "cards.card"
local utilities = require "utilities"

local Move3 = Card:extend()
Move3.targets = functional.map(table.values(utilities.directions), function(v) return v * 3 end)

function Move3:new(count)
    local card = Move3.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move3.png")
    card.id = "move3"
    return card
end

function Move3:use(level, position)
    level.player:move(position)
end

return Move3
