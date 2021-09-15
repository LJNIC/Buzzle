local Card = require "cards.card"
local Squar = require "entities.squar"
local utilities = require "utilities"

local Attack = Card:extend()
Attack.targets = sequence(table.values(utilities.directions))

function Attack:new(count)
    local card = Attack.super.new(self, count)
    card.id = "attack"
    return card
end

function Attack:use(level, position)
    level.player:attack(position)
    local object = level:objectAt(position)
    if object and object:is(Squar) then
        object.alive = false
    end
end

function Attack:validPosition(level, position)
    return level:tileAt(position) == 31
end

return Attack
