local Card = require "cards.card"
local utilities = require "utilities"

local Attack = Card:extend()
Attack.targets = utilities.directions

function Attack:new(count)
    local card = Attack.super.new(self, count)
    card.id = "attack"
    return card
end

return Attack
