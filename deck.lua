local Object = require "lib.classic"

local Deck = Object:extend()

local cardTypes = {
    ["attack"] = require "cards.attack",
    ["move1"] = require "cards.move1",
    ["move2"] = require "cards.move2",
    ["move3"] = require "cards.move3"
}

function Deck:new(cards)
    self.cards = {}
    for cardType, count in pairs(cards) do
        table.insert(self.cards, cardTypes[cardType](count))
    end
end

function Deck:draw()
    love.graphics.push()
    love.graphics.translate(50, 116)
    for _,card in ipairs(self.cards) do
        card:draw()
        love.graphics.translate(36, 0)
    end
    love.graphics.pop()
end

return Deck
