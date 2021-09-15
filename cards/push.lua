local Card = require "cards.card"
local Squar = require "entities.squar"
local directions = require("utilities").directions

local Push = Card:extend()
Push.targets = sequence(table.values(directions))

function Push:new(count)
    local card = Push.super.new(self, count)
    card.id = "push"
    card.image = love.graphics.newImage("assets/cards/push.png")
    return card
end

function Push:validPosition(level, position)
    return level:tileAt(position) == 31
end

function Push:use(level, position)
    local object = level:objectAt(position)
    if not object then return end
    local player = level.player

    if object:is(Squar) then
        local pushTo = (position - player.position) + position
        local atPushTo = level:objectAt(pushTo)
        if atPushTo and atPushTo:is(Squar) then return end

        object:move(pushTo, level)
        player:move(position, level)
    end
end

return Push
