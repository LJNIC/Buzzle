local Object = require "lib.classic"
local flux = require "lib.flux"

local Base = Object:extend()

local offset = Vec2(-1, -1)
local function convertToDrawn(position)
    return (position + offset) * TILE_WIDTH
end

function Base:new(x, y)
    self.position = Vec2(x, y)
    self.drawnPosition = convertToDrawn(self.position)
    self.moving = false
    self.alive = true
end

function Base:tick()
end

function Base:move(newPosition)
    if self.position == newPosition then return end

    local drawn = convertToDrawn(newPosition)

    if self.moving then
        self.drawnPosition = drawn
    end

    self.position = newPosition
    flux.to(self.drawnPosition, 0.2, {x = drawn.x, y = drawn.y}):oncomplete(function() self.moving = false end)
    self.moving = true
end

function Base:attack(position)
    local drawn = convertToDrawn(position)
    flux.to(self.drawnPosition, 0.1, {x = drawn.x, y = drawn.y}):ease("quadin"):oncomplete(function()
        local original = convertToDrawn(self.position)
        flux.to(self.drawnPosition, 0.2, {x = original.x, y = original.y}):ease("linear")
    end)
end

function Base:undo(other)
    self:move(other.position)
    self.alive = other.alive
end

function Base:copy()
    local copy = Base(self.position.x, self.position.y)
    copy.alive = self.alive
    return copy
end

function Base:__tostring()
    return self.position:__tostring()
end

return Base
