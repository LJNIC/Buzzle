local tick = require "lib.tick"
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

    self.damaged = false
    self.damagedAmount = nil
end

function Player:update(dt)
end

function Player:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
    Player.super.draw(self)
end

function Player:hurt(amount, through)
    if self.blocking < 1 or through then
        self.blocking = self.blocking - 1
        Player.super.hurt(self, amount)
    else
        self.blocking = self.blocking - 1
    end
end

return Player
