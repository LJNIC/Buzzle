local Object = require "lib.classic"
local Tileset = require "tileset"
local Player = require "player"
local Pudding = require "pudding"
local Deck = require "deck"

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
        local x, y = (object.x / TILE_WIDTH) + 1, object.y / TILE_WIDTH
        if object.type == "player" then
            self.player = Player(x, y)
        elseif object.type == "pudding" then
            self.pudding = Pudding(x, y)
        end
    end

    self.deck = Deck(level_data.properties, self.player)
    self.active = Vec2(-1, -1)
end

function Level:update(dt, x, y)
    if x == nil or y == nil then return end
    self.active.x = math.floor(x / TILE_WIDTH) + 1
    self.active.y = math.floor(y / TILE_WIDTH) + 1
end

function Level:draw()
    love.graphics.setCanvas(self.canvas)
    for y = 1, self.height do
        for x = 1, self.width do
            local t = self:tile_at(x, y)
            local drawX, drawY = (x - 1) * TILE_WIDTH, (y - 1) * TILE_WIDTH

            Tileset:drawTile(t, drawX, drawY)
            if x == self.active.x and y == self.active.y then
                love.graphics.setColor(1, 1, 0)
            end

            if t == 31 and self.deck:isTargeting(x, y) then
                Tileset:drawTile(17, drawX, drawY)
            end

            if t == 41 and self.deck:isTargeting(x, y - 1) then
                Tileset:drawTile(27, drawX, drawY)
            end

            love.graphics.setColor(1, 1, 1)
        end
    end
    self.pudding:draw()
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

    local index = (y - 1) * self.width + x

    return self.tiles[index]
end

return Level
