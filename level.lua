local Object = require "lib.classic"
local Tileset = require "tileset"
local Player = require "player"

local Level = Object:extend()
Level.tile_types = { [0] = "floor", [1] = "wall", [2] = "goal", [3] = "border" }
local tile_types = Level.tile_types

function Level:new(filename)
    local level_data = require(filename)

    self.width = level_data.width
    self.height = level_data.height

    self.canvas = love.graphics.newCanvas(self.width * TILE_WIDTH, self.height * TILE_WIDTH)

    local tile_layer = functional.find_match(level_data.layers, function(layer) return layer.name == "tiles" end)
    local object_layer = functional.find_match(level_data.layers, function(layer) return layer.name == "objects" end)

    self.tiles = tile_layer.data

    for _,object in ipairs(object_layer.objects) do
        if object.type == "player" then
            self.player = Player((object.x / TILE_WIDTH) + 1, object.y / TILE_WIDTH)
        end
    end
end

function Level:draw()
    love.graphics.setCanvas(self.canvas)
    for y = 1, self.height do
        for x = 1, self.width do
            local t = self:tile_at(x, y)
            love.graphics.draw(Tileset.image, Tileset.tiles[t], x * TILE_WIDTH, y * TILE_WIDTH)
        end
    end
    self.player:draw()
    love.graphics.setCanvas()
end

function Level:tile_at(base_position_x, y)
    local x = base_position_x
    local y = y

    if y == nil and base_position_x.position then
        x = base_position_x.position.x
        y = base_position_x.position.y
    elseif y == nil and base_position_x.x then
        x = base_position_x.x
        y = base_position_x.y
    end

    if x < 1 or x > self.width or y < 1 or y > self.height then
        return nil
    end

    return self.tiles[(y - 1) * self.width + x]
end

return Level
