local tick = require "lib.tick"
local Base = require "entities.base"
local Tileset = require "tileset"

local Player = Base:extend()
local font = love.graphics.newFont("assets/SinsGold.ttf", 16)

function Player:new(x, y, health)
    Player.super.new(self, x, y)
    self.tileId = 38
    self.health = tonumber(health)
    self.maxHealth = tonumber(health)
    self.energy = 3
    self.blocking = 0

    self.damaged = false
    self.damage = nil
end

function Player:update(dt)
end

function Player:draw()
    local drawn = self.drawnPosition
    Tileset:drawTile(self.tileId, drawn.x, drawn.y)

    if self.damaged then
        love.graphics.push("all")
        love.graphics.setColor(1, 0, 0)
        love.graphics.setFont(font)
        love.graphics.print("-" .. self.damage, drawn.x + TILE_WIDTH/4, drawn.y - TILE_WIDTH + 2)
        love.graphics.pop()
    end
end

function Player:hurt(amount)
    if self.blocking < 1 then
        self.health = math.max(self.health - amount, 0)
        self.damaged = true
        self.damage = amount
        tick.delay(function() self.damaged = false end, 1)
    end
end

return Player
