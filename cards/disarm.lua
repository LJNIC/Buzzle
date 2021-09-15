local Card = require "cards.card"
local Trap = require "entities.trap"
local directions = require("utilities").directions

local Disarm = Card:extend()
Disarm.targets = sequence(table.values(directions))

function Disarm:new(count)
    local card = Disarm.super.new(self, count)
    card.id = "disarm"
    card.image = love.graphics.newImage("assets/cards/disarm.png")
    return card
end

function Disarm:use(level, position)
    local object = level:objectAt(position)
    if object and object:is(Trap) then
        object.alive = false
    end
end

return Disarm
