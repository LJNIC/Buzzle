local tick = require "lib.tick"
local flux = require "lib.flux"
local Level = require "level"
local interface = require "interface"
local GameManager = require "game-manager"

local game = {}
interfaceScale = love.graphics.getWidth()/320
local gameScale = 4

function game:enter()
    GameManager:enter(1)
end

function game:update(dt)
    interface:update(dt)
    GameManager.level:update(dt, game:getMouse())
    flux.update(dt) 
    tick.update(dt)
end

function game:getMouse()
    local x, y = love.mouse.getPosition()
    local width, height = love.graphics.getDimensions()
    local level = GameManager.level
    x = (x - width / 2) / gameScale + level.canvas:getWidth() / 2
    y = (y - height / 3) / gameScale + level.canvas:getHeight() / 2
    return x, y
end

function game:draw()
    love.graphics.setBackgroundColor(29/255, 16/255, 28/255)

    local level = GameManager.level
    level:draw(GameManager.deck)
    interface:draw()

    love.graphics.draw(level.canvas, love.graphics.getWidth()/2, math.floor(love.graphics.getHeight() * 0.3), 0, gameScale, gameScale, level.canvas:getWidth()/2, level.canvas:getHeight()/2)
    love.graphics.draw(interface.canvas, 0, 0, 0, interfaceScale, interfaceScale)
end

local numbers = {["1"] = 1, ["2"] = 2, ["3"] = 3, ["4"] = 4, ["5"] = 5, ["6"] = 6, ["7"] = 7, ["8"] = 8, ["9"] = 9}
function game:keypressed(key)
    if key == "right" then
        gameScale = gameScale + 1
    elseif key == "left" then
        gameScale = gameScale - 1
    elseif key == "n" then
        GameManager:enter(GameManager.levelNumber + 1)
    end

    local number = numbers[key]
    if number then GameManager:selectCard(number) end
end

function game:mousepressed(x, y)
    for i, card in ipairs(GameManager.deck.cards) do
        if card.hovered then
            GameManager.deck:selectCard(i, GameManager.level)
        end
    end

    GameManager:useCard()
end

return game
