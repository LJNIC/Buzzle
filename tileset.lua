local image = love.graphics.newImage("levels/tileset1.png")
local data = require "levels.tileset1"

local quads = {}
for y = 0, data.tilecount/data.columns - 1 do
    for x = 0, data.columns - 1 do
        table.insert(quads, love.graphics.newQuad(x * TILE_WIDTH, y * TILE_WIDTH, TILE_WIDTH, TILE_WIDTH, image:getWidth(), image:getHeight()))
    end
end

local tiles = {}
for _,tile in ipairs(data.tiles) do
    tiles[tile.id + 1] = tile
end

local entities = {}
entities.squar = { damage = 1, direction = "right" }
entities.player = { health = 3 }

local Tileset = {}
Tileset.image = image
Tileset.quads = quads
Tileset.tiles = tiles
Tileset.entities = entities

function Tileset:drawTile(id, x, y)
    love.graphics.draw(self.image, self.quads[id], x, y)
end

function Tileset:getProperties(type, properties)
    if self.entities[type] then
        return table.overlay(self.entities[type], properties)
    else
        return properties
    end
end

return Tileset
