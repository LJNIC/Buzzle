local Object = require "lib.classic"
local Tileset = require "tileset"
local Player = require "player"

local Level = Object:extend()

function Level:new(filename)
    local level_data = require(filename)

    local tile_layer = functional.find_match(level_data.layers, function(layer) return layer.name == "tiles" end)
    local object_layer = functional.find_match(level_data.layers, function(layer) return layer.name == "objects" end)

    self.tiles = tile_layer.data

    for _,object in ipairs(object_layer.objects) do
        if object.type == "player" then
            self.player = Player(object.x / TILE_WIDTH, object.y / TILE_WIDTH)
        end
    end
end

return Level
