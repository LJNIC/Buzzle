local Card = require "cards.card"

local Block = Card:extend()
Block.targets = {Vec2(0, 0)}

function Block:new(count)
    local card = Block.super.new(self, count)
    card.id = "block"
    card.image = love.graphics.newImage("assets/cards/block.png")
    return card
end

function Block:use(level, position)
    level.player.blocking = 2
end

return Block
