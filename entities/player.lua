local Base = require "entities.base"
local Tileset = require "tileset"

local Player = Base:extend()

function Player:new(x, y, health)
    Player.super.new(self, x, y)
    self.tileId = 38
    self.health = tonumber(health)
    self.maxHealth = tonumber(health)
    self.energy = 3
    self.blocking = 0
end

function Player:update(dt)
end

function Player:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
end

function Player:damage(amount)
    if self.blocking < 1 then
        self.health = self.health - amount
    end
end

return Player
