local Object = require "lib.classic"
local flux = require "lib.flux"

local Base = Object:extend()

function Base:new(x, y)
    self.position = Vec2(x, y)
    self.drawnPosition = (TILE_WIDTH * self.position) - Vec2(TILE_WIDTH, TILE_WIDTH)
    self.moving = false
    self.alive = true
end

function Base:tick()
end

function Base:move(newPosition)
    if self.position == newPosition then return end

    if self.moving then
        self.drawnPosition = self.position * TILE_WIDTH
    end

    self.position = newPosition
    local newDrawn = (newPosition - Vec2(1, 1)) * TILE_WIDTH
    flux.to(self.drawnPosition, 0.2, {x = newDrawn.x, y = newDrawn.y}):oncomplete(function() self.moving = false end)
    self.moving = true
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
