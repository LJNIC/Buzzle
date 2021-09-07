local Base = require "base"
local Tileset = require "tileset"

local Player = Base:extend()

function Player:new(x, y)
    Player.super.new(self, x, y)
    self.tile_id = 46
end

function Player:draw()
    local drawn = self.drawn_position
    love.graphics.draw(Tileset.image, Tileset.tiles[self.tile_id], drawn.x, drawn.y)
end

return Player
