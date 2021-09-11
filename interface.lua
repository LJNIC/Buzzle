local Plan = require "lib.plan"
local Rules = Plan.Rules
local Container = Plan.Container
local Box = require "box"

local rootRules = Rules.new()
    :addX(Plan.pixel(0))
    :addY(Plan.pixel(0))
    :addWidth(Plan.pixel(320))
    :addHeight(Plan.pixel(180))
local root = Container:new(rootRules)
root.isUIRoot = true

local deckRules = Rules.new()
    :addX(Plan.pixel(48))
    :addY(Plan.pixel(114))
    :addWidth(Plan.pixel(224))
    :addHeight(Plan.pixel(64))
local deckContainer = Container:new(deckRules)

local interface = {}
interface.canvas = love.graphics.newCanvas(320, 180)

local uiImage = love.graphics.newImage("assets/UI.png")

function interface:enterLevel(level)
    self.deck = level.deck
    local cardsRules = Rules.new()
        :addX(Plan.center())
        :addY(Plan.pixel(2))
        :addWidth(Plan.pixel(#self.deck.cards * 34))
        :addHeight(Plan.pixel(48))
    
    local cardsContainer = Container:new(cardsRules)

    for i, card in ipairs(self.deck.cards) do
        local cardRules = Rules.new()
            :addY(Plan.pixel(2))
            :addX(Plan.pixel((i - 1) * 32 + (i - 1) * 3))
            :addWidth(Plan.pixel(32))
            :addHeight(Plan.pixel(48))
        card.rules = cardRules

        cardsContainer:addChild(card)
    end
    deckContainer:addChild(cardsContainer)
    root:addChild(deckContainer)
end

function interface:click()
    for i, card in ipairs(self.deck.cards) do
        if card.hovered then
            self.deck:selectCard(i)
        end
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