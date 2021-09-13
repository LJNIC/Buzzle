local Card = require "cards.card"

local block = Card:extend()


function block:new(count)
    local card = block.super.new(self, count)
    card.id = "block"
    return card
end




return block
