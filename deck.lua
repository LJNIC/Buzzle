local Object = require "lib.classic"
local tick = require "lib.tick"

local Deck = Object:extend()

local cardTypes = {
    ["move1"] = require "cards.move1",
    ["move2"] = require "cards.move2",
    ["move3"] = require "cards.move3",
    ["attack"] = require "cards.attack",
    ["block"] = require "cards.block",
    ["disarm"] = require "cards.disarm",
    ["push"] = require "cards.push"
}
local cardOrder = { move1 = 1, move2 = 2, move3 = 3, attack = 4, block = 5, disarm = 6, push = 7}

function Deck:new(cards, player)
    self.player = player
    self.cards = {}
    for cardType, count in pairs(cards) do
        local card = cardTypes[cardType]
        table.insert(self.cards, card:new(count))
    end
    table.sort(self.cards, function(a, b) return cardOrder[a.id] < cardOrder[b.id] end)
    self.stack = sequence{}
    self.active = nil
    self.targets = nil
end

function Deck:undo()
    local card = self.stack:pop()
    if card then card.count = card.count + 1 end
end

function Deck:selectCard(index, level)
    if self.cards[index].count < 1 then return end
    self.active = self.cards[index]
    for _, card in ipairs(self.cards) do card.selected = false end
    self.active.selected = true
    self.targets = sequence(self.active:validatedTargets(level))
end

function Deck:isTargeting(x, y)
    if self.targets == nil then return false end
    return self.targets:any(function(v) return v.x == x and v.y == y end)
end

function Deck:useCard(level, position)
    local card = self.active
    self.stack:push(card)
    card:use(level, position:copy())
    card.selected = false
    card.count = card.count - 1
    self.active = nil
    self.targets = nil
end

return Deck
