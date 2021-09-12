local Card = require "cards.card"
local utilities = require "utilities"

local Attack = Card:extend()
Attack.targets = utilities.directions

function Attack:new(count)
    local card = Attack.super.new(self, count)
    card.id = "attack"
    return card
end

function Attack:use(level, position)
    for _,object in ipairs(level.objects) do
        if object.position == position then
            object.alive = false
            return
        end
    end
end

function Attack:validPosition(level, position)
    return level:tileAt(position) == 31
end

return Attack
