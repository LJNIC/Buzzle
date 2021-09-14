local tick = require "lib.tick"
local Level = require "level"
local Deck = require "deck"
local interface = require "interface"
local GameManager = {}

GameManager.levels = {}
local level_count = functional.count(love.filesystem.getDirectoryItems("levels"), function(file) 
    return string.contains(file, "level") and string.ends_with(file, ".lua") 
end) 

for i = 1, level_count do
    table.insert(GameManager.levels, Level("levels.level" .. i))
end

function GameManager:enter(levelNumber)
    self.level = self.levels[levelNumber]
    self.levelNumber = levelNumber
    self.deck = Deck(self.level.cards, self.level.player)
    interface:enter(self.deck, self.level.player)
end

function GameManager:checkWin()
    for _,pudding in ipairs(self.level.puddings) do
        if pudding.alive then
            return
        end
    end

    tick.delay(function() self:enter(self.levelNumber + 1) end, 0.3)
end

function GameManager:selectCard(index)
    if index and #self.deck.cards >= index then
        self.deck:selectCard(index, self.level)
    end
end

function GameManager:useCard()
    if not self.deck.targets then return end

    local level = self.level
    local tile = level.active
    if functional.any(self.deck.targets, function(v) return v.x == tile.x and v.y == tile.y end) then
        self.deck:useCard(level, tile)
    else
        return
    end

    -- if we played a card, play out a turn
    tick.delay(function() GameManager:doTurn() end, 0.2)
end

function GameManager:doTurn()
    for _,enemy in ipairs(functional.filter(self.level.objects, function(o) return o.alive end)) do
        enemy:attack(self.level)
    end

    local pudding = functional.find_match(self.level.puddings, function(p) return p.position == self.level.player.position end)
    if pudding then pudding.alive = false end

    interface:updateHealth()

    tick.delay(function() GameManager:checkWin() end, 0.2)
end

return GameManager
