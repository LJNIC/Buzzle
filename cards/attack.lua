local Card = require "cards.card"

local Attack = Card:extend()

function Attack:new(count)
    local card = Attack.super.new(self, count)
    return card
end

return Attack
