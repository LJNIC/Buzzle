local Tileset = require "tileset"
local Base = require "entities.base"

local Trap = Base:extend()

function Trap:new(x, y)
    Trap.super.new(self, x, y)
    self.damage = 3
    self.tileId = 15
end

function Trap:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
end

function Trap:attack(level)
    local object = level:objectAt(self.position)
    if object then
        object:damage(self.damage)
    end
end

return Trap
