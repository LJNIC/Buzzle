local tick = require "lib.tick"
local Level = require "level"
local Deck = require "deck"
local interface = require "interface"
local filters = require "filters"

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

function GameManager:reload()
    self.level = Level("levels.level" .. self.levelNumber)
    self.deck = Deck(self.level.cards, self.level.player)
    interface:enter(self.deck, self.level.player)
end

function GameManager:checkWin()
    local pudding = self.level.puddings
        :find_match(filters.alive)
    -- if a pudding is still alive, we haven't won
    if pudding then return end

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
    if self.deck.targets:any(filters.equal(tile)) then
        self.deck:useCard(level, tile)
    else
        return
    end

    -- if we played a card, play out a turn
    tick.delay(function() GameManager:doTurn() end, 0.6)
end

function GameManager:doTurn()
    local level = self.level

    level.objects
        :filter(function(object) return level:isVoid(object) end)
        :foreach(function(object) object.alive = false end)

    level.objects
        :filter(filters.alive)
        :foreach(function(object) object:attack(level) end)

    local pudding = level.puddings
        :find_match(function(p) return p.position == level.player.position end)
    if pudding then pudding.alive = false end

    interface:updateHealth()

    if level.player.blocking > 0 then
        level.player.blocking = level.player.blocking - 1
    end

    tick.delay(function() GameManager:checkWin() end, 0.2)
end

return GameManager
