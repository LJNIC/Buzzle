local Tileset = require "tileset"
local Base = require "entities.base"

local Pudding = Base:extend()

function Pudding:new(x, y)
    Pudding.super.new(self, x, y)
    self.tileId = 28
end

function Pudding:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)
end

return Pudding
