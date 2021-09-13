local Tileset = require "tileset"
local Base = require "entities.base"

local Squar = Base:extend()

function Squar:new(x, y, attack)
    Squar.super.new(self, x, y)
    self.tile_id = 39
end

function Squar:draw()
    local drawn = self.drawnPosition
    love.graphics.draw(Tileset.image, Tileset.tiles[self.tile_id], drawn.x, drawn.y)
end

return Squar
