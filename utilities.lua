local utilities = {}

utilities.directions = {down = Vec2(0, 1), left = Vec2(-1, 0), right = Vec2(1, 0), up = Vec2(0, -1)}

local offset = Vec2(-1, -1)
function utilities.convertToDrawn(position)
    return (position + offset) * TILE_WIDTH
end

return utilities

