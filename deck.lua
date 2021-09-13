local Object = require "lib.classic"
local tick = require "lib.tick"

local Deck = Object:extend()

local cardTypes = {
    ["attack"] = require "cards.attack",
    ["move1"] = require "cards.move1",
    ["move2"] = require "cards.move2",
    ["move3"] = require "cards.move3"
}

function Deck:new(cards, player)
    self.player = player
    self.cards = {}
    for cardType, count in pairs(cards) do
        local card = cardTypes[cardType]
        table.insert(self.cards, card:new(count))
    end
    table.sort(self.cards, function(a, b) return a.id < b.id end)
    self.active = nil
    self.targets = nil
end

function Deck:selectCard(index, level)
    if self.cards[index].count < 1 then return end
    self.active = self.cards[index]
    for _, card in ipairs(self.cards) do card.selected = false end
    self.active.selected = true
    self.targets = self.active:validatedTargets(level)
end

function Deck:isTargeting(x, y)
    if self.targets == nil then return false end
    return functional.any(self.targets, function(v) return v.x == x and v.y == y end)
end

function Deck:useCard(level, position)
    local card = self.active
    card:use(level, position:copy())
    card.selected = false
    card.count = card.count - 1
    self.active = nil
    self.targets = nil
end

return Deck
