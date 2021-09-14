local Card = require "cards.card"

local Block = Card:extend()

function Block:new(count)
    local card = Block.super.new(self, count)
    card.id = "block"
    card.image = love.graphics.newImage("assets/cards/block.png")
    return card
end

return Block
