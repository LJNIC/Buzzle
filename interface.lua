local Plan = require "lib.plan"
local Rules = Plan.Rules
local Container = Plan.Container

local rootRules = Rules.new()
    :addX(0)
    :addY(0)
    :addWidth(320)
    :addHeight(180)
local root = Container:new(rootRules)
root.isUIRoot = true

local deckRules = Rules.new()
    :addX(48)
    :addY(114)
    :addWidth(224)
    :addHeight(64)
local deckContainer = Container:new(deckRules)

local interface = {}
interface.canvas = love.graphics.newCanvas(320, 180)

local uiImage = love.graphics.newImage("assets/UI.png")

local HealthIcon = Container:extend()
HealthIcon.imageFull = love.graphics.newImage("assets/health.png")
HealthIcon.imageEmpty = love.graphics.newImage("assets/health_empty.png")

function HealthIcon:new(rules)
    local icon = HealthIcon.super.new(self, rules)
    icon.full = true
    return icon
end

function HealthIcon:draw()
    love.graphics.setColor(1, 1, 1)
    if self.full then
        love.graphics.draw(HealthIcon.imageFull, self.x, self.y)
    else
        love.graphics.draw(HealthIcon.imageEmpty, self.x, self.y)
    end
end

function interface:enter(deck, player)
    self.deck = deck
    self.player = player

    root:removeChild(deckContainer)
    deckContainer:removeChild(self.cardsContainer)

    local cardsRules = Rules.new()
        :addX(Plan.center())
        :addY(2)
        :addWidth(#self.deck.cards * 34)
        :addHeight(48)
    
    self.cardsContainer = Container:new(cardsRules)

    for i, card in ipairs(self.deck.cards) do
        local cardRules = Rules.new()
            :addY(6)
            :addX((i - 1) * 34)
            :addWidth(32)
            :addHeight(48)
        card.rules = cardRules

        self.cardsContainer:addChild(card)
    end

    deckContainer:addChild(self.cardsContainer)

    self.healthIcons = {}
    print(type(self.player.health))
    for i = 1, self.player.health do
        local healthRules = Rules.new()
            :addY((i - 1) * 9 + 2)
            :addX(2)
            :addWidth(10)
            :addHeight(9)

        table.insert(self.healthIcons, HealthIcon:new(healthRules))
        deckContainer:addChild(self.healthIcons[i])
    end

    root:addChild(deckContainer)
end

function interface:updateHealth()
    local player = self.player
    --if player.health == player.maxHealth then return end

    for i = player.maxHealth, player.health + 1, -1 do
        self.healthIcons[i].full = false
    end
end

function interface:update(dt)
    root:update(dt)
end

function interface:draw()
    love.graphics.push("all")
    love.graphics.setCanvas(self.canvas)
    love.graphics.draw(uiImage)
    root:draw()
    love.graphics.pop()
end

return interface
