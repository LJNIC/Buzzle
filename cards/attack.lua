local Card = require "cards.card"

local Attack = Card:extend()

function Attack:new(count)
    Attack.super.new(self, count)
end

return Attack
