local image = love.graphics.newImage("Levels/tileset1.png")
local data = require "Levels.tileset1"

local tiles = {}
for x = 0, data.columns - 1 do
    for y = 0, data.tilecount/data.columns - 1 do
        table.insert(tiles, love.graphics.newQuad(x * TILE_WIDTH, y * TILE_WIDTH, TILE_WIDTH, TILE_WIDTH, image:getWidth(), image:getHeight()))
    end
end

local Tileset = {}
Tileset.image = image
Tileset.tiles = tiles

return Tileset
