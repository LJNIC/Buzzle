local Card = require "cards.card"
local utilities = require "utilities"

local Move1 = Card:extend()
Move1.targets = sequence(table.values(utilities.directions))
Move1.highlights = {top = 17, edge = 27, confirm = 70, cedge = 80}

function Move1:new(count)
    local card = Move1.super.new(self, count)
    card.image = love.graphics.newImage("assets/cards/move1.png")
    card.id = "move1"
    return card
end

function Move1:use(level, position)
    level.player:move(position, level)
end

return Move1
