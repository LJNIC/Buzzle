local Object = require "lib.classic"
local tick = require "lib.tick"
local flux = require "lib.flux"
local utilities = require "utilities"
local filters = require "filters"
local convertToDrawn = utilities.convertToDrawn

local Base = Object:extend()
local font = love.graphics.newFont("assets/SinsGold.ttf", 16)

function Base:new(x, y)
    self.position = Vec2(x, y)
    self.drawnPosition = convertToDrawn(self.position)
    self.moving = false
    self.alive = true
    self.damaged = false
    self.damagedAmount = nil
end

function Base:draw()
    local drawn = self.drawnPosition
    if self.damaged then
        love.graphics.push("all")
        love.graphics.setColor(1, 0, 0)
        love.graphics.setFont(font)
        love.graphics.print("-" .. self.damagedAmount, drawn.x + TILE_WIDTH/4, drawn.y - TILE_WIDTH + 2)
        love.graphics.pop()
    end
end

function Base:hurt(amount)
    self.health = math.max(self.health - amount, 0)
    self.damaged = true
    self.damagedAmount = amount
    tick.delay(function() 
        self.damaged = false
        self.alive = self.health > 0
    end, 0.5)
end

function Base:move(newPosition, level)
    if self.position == newPosition then return end

    local drawn = convertToDrawn(newPosition)

    if self.moving then
        self.drawnPosition = drawn
    end

    local between = utilities.between(self.position, newPosition)
        :filter(function(v) 
            local o = level:objectAt(v)
            return o and o.alive and o:is(require "entities.trap")
        end)

    local distance = self.position:distance(newPosition)

    self.position = newPosition
    local tween = flux.to(self.drawnPosition, 0.4, {x = drawn.x, y = drawn.y})
        :oncomplete(function() self.moving = false end)
        :onupdate(function() 
            local real = utilities.convertToReal(self.drawnPosition)
            local v, i = between:find_match(filters.equal(real))
            if v then
                self:hurt(3, true)
                table.remove(between, i)
            end
        end)

    self.moving = true
end

function Base:attack(position)
    local drawn = convertToDrawn(position)
    self.attacking = true
    flux.to(self.drawnPosition, 0.1, {x = drawn.x, y = drawn.y}):ease("quadin"):oncomplete(function()
        local original = convertToDrawn(self.position)
        flux.to(self.drawnPosition, 0.2, {x = original.x, y = original.y}):ease("linear"):oncomplete(function()
            self.attacking = false
        end)
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

return Base
