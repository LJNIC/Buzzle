local Card = require "cards.card"

local disarm = Card:extend()


function disarm:new(count)
    local card = disarm.super.new(self, count)
    card.id = "disarm"
    return card
end




return disarm
