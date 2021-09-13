local Tileset = require "tileset"
local Base = require "entities.base"

local Pudding = Base:extend()

function Pudding:new(x, y)
    Pudding.super.new(self, x, y)
    self.tile_id = 28
end

function Pudding:draw()
    local drawn = self.drawnPosition
    love.graphics.draw(Tileset.image, Tileset.tiles[self.tile_id], drawn.x, drawn.y)
end

return Pudding
