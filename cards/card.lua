local Plan = require "lib.plan"
local Rules = Plan.Rules
local Container = Plan.Container
local Object = require "lib.classic"

local Card = Container:extend()
local font = love.graphics.newFont("assets/SinsGold.ttf", 32)

local cardRules = Rules.new()
    :addX(Plan.pixel(0))
    :addX(Plan.pixel(0))
    :addWidth(Plan.pixel(32))
    :addHeight(Plan.pixel(48))

function Card:new(count)
    local card = Card.super.new(self, cardRules)
    card.count = count
    card.image = love.graphics.newImage("assets/cards/attack.png")
    card.hovered = false
    card.selected = false
    return card
end

function Card:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y)

    if self.selected then
        love.graphics.setColor(1, 1, 0)
    end

    if self.hovered or self.selected then
        love.graphics.rectangle("line", self.x, self.y, 32, 48)
    end

    Card.super.draw(self)
    --love.graphics.setFont(font)
    --love.graphics.setColor(0.1, 0.1, 0.2)
    --love.graphics.print("x" .. tostring(self.count), self.x, self.y)
end

function Card:update(dt)
    if self.count < 1 then
        self.hovered = false
        return
    end

    local x, y = love.mouse.getPosition()
    x = x / 4
    y = y / 4
    if x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h then
        self.hovered = true
    else 
        self.hovered = false
    end
end

function Card:use(level, position)
end

return Card
