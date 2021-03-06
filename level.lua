local Object = require "lib.classic"
local Tileset = require "tileset"
local Player = require "entities.player"
local Pudding = require "entities.pudding"
local Squar = require "entities.squar"
local Trap = require "entities.trap"
local filters = require "filters"

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

    self.objects = sequence{}
    self.puddings = sequence{}
    for _,object in ipairs(object_layer.objects) do
        local properties = object.properties
        local x, y = (object.x / TILE_WIDTH) + 1, object.y / TILE_WIDTH

        local objectType = Tileset.tiles[object.gid] and Tileset.tiles[object.gid].type or ""
        local properties = Tileset:getProperties(objectType, properties)

        if objectType == "player" then
            self.player = Player(x, y, properties.health)
        elseif objectType == "pudding" then
            self.puddings:push(Pudding(x, y))
        elseif objectType == "squar" then
            self.objects:push(Squar(x, y, properties.damage, properties.direction))
        elseif objectType == "trap" then
            self.objects:push(Trap(x, y))
        end
    end

    self.cards = level_data.properties

    self.stack = sequence{{ player = self.player, objects = self.objects, puddings = self.puddings }}

    self.active = Vec2(-1, -1)
    self.activeValid = false
end

function Level:save()
    self.saved_state = { player = self.player:copy(), objects = table.copy(self.objects, true), puddings = table.copy(self.puddings, true) }
end

function Level:push()
    self.stack:push(self.saved_state)
end

function Level:undo()
    local top = self.stack:pop()

    if top then
        self.player:move(top.player.position, self)
        for i, object in ipairs(self.objects) do
            object:undo(top.objects[i], self)
        end

        for i, pudding in ipairs(self.puddings) do
            pudding:undo(top.puddings[i], self)
        end
    end
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
    love.graphics.clear()
    for y = 1, self.height do
        for x = 1, self.width do
            Tileset:drawAtPosition(self:tileAt(x, y), x, y)
        end
    end

    for _,object in ipairs(self.objects) do
        if object:is(Trap) then 
            if object.alive then
                object:draw() 
            else
                Tileset:drawAtPosition(35, object.position.x, object.position.y)
            end
        end
    end

    for _,object in ipairs(self.objects) do
        if object.alive and not object:is(Trap) then object:drawTarget() end
    end

    self:drawTargets(deck)

    for _,object in ipairs(self.objects) do
        if object.alive and not object:is(Trap) then object:draw() end
    end

    self.puddings:foreach(filters.draw)

    if self.player.alive then
        self.player:draw()
    end
    love.graphics.setCanvas()
end

function Level:drawTargets(deck)
    if not deck.active then return end

    for _,target in ipairs(deck.targets) do
        local t = self:tileAt(target)
        local active = self:isActive(target.x, target.y)
        local edge = self:tileAt(target.x, target.y + 1) == 41

        Tileset:drawAtPosition(deck.active:getHighlight(active, false), target.x, target.y)
        if edge then
            Tileset:drawAtPosition(deck.active:getHighlight(active, true), target.x, target.y + 1)
        end
    end

end

function Level:objectAt(vecOrX, y)
    local x = y and vecOrX or vecOrX.x
    local y = y and y or vecOrX.y

    if self.player.position.x == x and self.player.position.y == y then
        return self.player
    else
        return self.objects:find_match(function(o) return o.position.x == x and o.position.y == y end)
    end
end

function Level:isWalkable(vecOrX, y)
    local object = self.objects
        :filter(filters.alive)
        :any(function(o) return o:is(Squar) and o.position:equal(vecOrX, y) end)

    return not object and self:tileAt(vecOrX, y) == 31
end

function Level:isVoid(basePositionX, y)
    local tile = self:tileAt(basePositionX, y)
    return tile == 51 or tile == 41
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
