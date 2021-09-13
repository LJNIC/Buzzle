local Base = require "entities.base"
local Tileset = require "tileset"

local Player = Base:extend()

function Player:new(x, y)
    Player.super.new(self, x, y)
    self.tileId = 38
    self.health = 3
    self.energy = 3
end

function Player:update(dt)
end

function Player:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
end

return Player
