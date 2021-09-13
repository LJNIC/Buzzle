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

function GameManager:enter(level_number)
    self.level = self.levels[level_number]
    self.level_number = level_number
    self.deck = Deck(self.level.cards, self.level.player)
    interface:enter(self.level, self.deck)
end

function GameManager:checkWin()
    for _,pudding in ipairs(self.level.puddings) do
        if pudding.alive then
            return
        end
    end

    tick.delay(function() self:enter(self.level_number + 1) end, 0.3)
    
end

function GameManager:update()
    local pudding = functional.find_match(self.level.puddings, function(p) return p.position == self.level.player.position end)
    if pudding then pudding.alive = false end
    self:checkWin()
end

function GameManager:selectCard(index)
    print(self.level)
    if index and #self.deck.cards >= index then
        self.deck:selectCard(index, self.level)
    end
end

function GameManager:useCard()
    if not self.deck.targets then return end

    local tile = self.level.active
    if functional.any(self.deck.targets, function(v) return v.x == tile.x and v.y == tile.y end) then
        self.deck:useCard(self.level, tile)
    end

    tick.delay(function() GameManager:update() end, 0.2)
end

return GameManager
