local image = love.graphics.newImage("levels/tileset1.png")
local data = require "levels.tileset1"

local tiles = {}
for y = 0, data.tilecount/data.columns - 1 do
    for x = 0, data.columns - 1 do
        table.insert(tiles, love.graphics.newQuad(x * TILE_WIDTH, y * TILE_WIDTH, TILE_WIDTH, TILE_WIDTH, image:getWidth(), image:getHeight()))
    end
end

local Tileset = {}
Tileset.image = image
Tileset.tiles = tiles

return Tileset
