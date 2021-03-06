local Card = require "cards.card"

local Block = Card:extend()
Block.targets = sequence{Vec2(0, 0)}
Block.highlights = {top = 67, edge = 77, confirm = 68, cedge = 78}

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
