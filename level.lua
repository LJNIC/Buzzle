local Object = require "lib.classic"
local Tileset = require "tileset"
local Player = require "entities.player"
local Pudding = require "entities.pudding"
local Squar = require "entities.squar"

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

    self.objects = {}
    self.puddings = {}
    for _,object in ipairs(object_layer.objects) do
        local x, y = (object.x / TILE_WIDTH) + 1, object.y / TILE_WIDTH
        if object.type == "player" then
            self.player = Player(x, y)
        elseif object.type == "pudding" then
            table.insert(self.puddings, Pudding(x, y))
        elseif object.type == "squar" then
            table.insert(self.objects, Squar(x, y))
        end
    end

    self.cards = level_data.properties

    self.active = Vec2(-1, -1)
    self.activeValid = false
end

function Level:update(dt, x, y)
    if x == nil or y == nil then return end
    local x, y = math.floor(x / TILE_WIDTH) + 1, math.floor(y / TILE_WIDTH) + 1
    if self:tileAt(x, y) then
        self.active.x = x
        self.active.y = y
        self.activeValid = true
    else
        self.activeValid = false
    end
end

function Level:isActive(x, y)
    return self.active.x == x and self.active.y == y
end

function Level:draw(deck)
    love.graphics.setCanvas(self.canvas)
    for y = 1, self.height do
        for x = 1, self.width do
            local t = self:tileAt(x, y)
            local drawX, drawY = (x - 1) * TILE_WIDTH, (y - 1) * TILE_WIDTH

            Tileset:drawTile(t, drawX, drawY)
            if t == 31 and deck:isTargeting(x, y) then
                if self:isActive(x, y) then
                    Tileset:drawTile(68, drawX, drawY)
                else
                    Tileset:drawTile(17, drawX, drawY)
                end
            end

            if t == 41 and deck:isTargeting(x, y - 1) then
                if self:isActive(x, y - 1) then
                    Tileset:drawTile(78, drawX, drawY)
                else
                    Tileset:drawTile(27, drawX, drawY)
                end
            end

            love.graphics.setColor(1, 1, 1)
        end
    end

    for _,object in ipairs(self.objects) do
        if object.alive then
            object:draw()
        end
    end

    for _,pudding in ipairs(self.puddings) do
        if pudding.alive then
            pudding:draw()
        end
    end

    self.player:draw()
    love.graphics.setCanvas()
end

function Level:isWalkable(vecOrX, y)
    for _,object in ipairs(self.objects) do
        if object.alive and object.position:equal(vecOrX, y) and object:is(Squar) then
            return false
        end
    end
    return self:tileAt(vecOrX, y) == 31
end

function Level:tileAt(base_position_x, y)
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
