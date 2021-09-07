local Base = require "base"

local Player = Base:extend()

function Player:new(x, y)
    Player.super.new(x, y)
end

return Player
