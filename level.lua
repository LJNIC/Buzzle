local Object = require "lib.classic"

local Level = Object:extend()

function Level:new(filename)
    local level_data = require(filename)
end

return Level
