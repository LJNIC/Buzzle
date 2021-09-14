local Card = require "cards.card"

local Push = Card:extend()

function Push:new(count)
    local card = Push.super.new(self, count)
    card.id = "push"
    card.image = love.graphics.newImage("assets/cards/push.png")
    return card
end

return Push
