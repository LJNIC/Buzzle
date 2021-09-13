local Card = require "cards.card"

local push = Card:extend()


function push:new(count)
    local card = push.super.new(self, count)
    card.id = "push"
    return card
end




return push
