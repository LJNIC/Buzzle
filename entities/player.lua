local Base = require "entities.base"
local Tileset = require "tileset"

local Player = Base:extend()

function Player:new(x, y, health)
    Player.super.new(self, x, y)
    self.tileId = 38
    self.health = health
    self.maxHealth = health
    self.energy = 3
end

function Player:update(dt)
end

function Player:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
end

function Player:damage(amount)
    self.health = self.health - amount
end

return Player
