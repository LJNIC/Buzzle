local Card = require "cards.card"

local Disarm = Card:extend()

function Disarm:new(count)
    local card = Disarm.super.new(self, count)
    card.id = "disarm"
    card.image = love.graphics.newImage("assets/cards/disarm.png")
    return card
end

return Disarm
