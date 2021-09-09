local Plan = require "lib.plan"
local Rules = Plan.Rules
local Container = Plan.Container
local Level = require "level"

local game = {}
local uiImage = love.graphics.newImage("assets/UI.png")
local interfaceScale = 4
local gameScale = 4

function game:enter()
    self.level = Level("levels.level1")
    self.root = Plan.new()

    local gameRules = Rules.new()
        :addX(Plan.center())

    self.gameContainer = Container:new(gameRules)

    self.root:addChild(self.gameContainer)
end

function game:update(dt)
    self.root:update(dt)
end

function game:draw()
    self.level:draw()

    love.graphics.push()
        love.graphics.scale(gameScale, gameScale)
        love.graphics.draw(self.level.canvas, 48)
    love.graphics.pop()
    love.graphics.push()
        love.graphics.scale(interfaceScale, interfaceScale)
        love.graphics.draw(uiImage)
    love.graphics.pop()
end

return game
