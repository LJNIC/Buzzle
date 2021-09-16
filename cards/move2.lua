local Card = require "cards.card"
local utilities = require "utilities"

local Move2 = Card:extend()
Move2.targets = sequence(table.values(utilities.directions)):map(function(v) return v * 2 end)
Move2.highlights = {top = 17, edge = 27, confirm = 70, cedge = 80}

function Move2:new(count)
    local card = Move2.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move2.png")
    card.id = "move2"
    return card
end

function Move2:use(level, position)
    level.player:move(position, level)
end

return Move2
