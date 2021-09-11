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
        local card = cardTypes[cardType]
        table.insert(self.cards, card:new(count))
    end
    self.active = nil
    self.targets = nil
end

function Deck:selectCard(index)
    self.active = self.cards[index]
    for _, card in ipairs(self.cards) do card.selected = false end
    self.active.selected = true
end

return Deck
