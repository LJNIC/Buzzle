local Tileset = require "tileset"
local Base = require "entities.base"
local utilities = require("utilities")

local Squar = Base:extend()
Squar.damageTiles = {48, 49, 50}

function Squar:new(x, y, damage, direction)
    Squar.super.new(self, x, y)
    self.direction = utilities.directions[direction]
    self.damage = damage
    self.tileId = 39
end

function Squar:move(newPosition)
    Squar.super.move(self, newPosition)
    self.attackPosition = utilities.convertToDrawn(self.position + self.direction)
end

function Squar:draw()
    local drawn = self.drawnPosition
    if not self.attacking then
        Tileset:drawTile(Squar.damageTiles[self.damage], drawn.x + self.direction.x * TILE_WIDTH, drawn.y + self.direction.y * TILE_WIDTH)
    end
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
end

function Squar:damage(amount)
    self.alive = false
end

function Squar:attack(level)
    local attackPosition = self.position + self.direction
    Squar.super.attack(self, attackPosition)
    local object = level:objectAt(attackPosition)
    if object then
        object:damage(self.damage)      
    end
end

return Squar
