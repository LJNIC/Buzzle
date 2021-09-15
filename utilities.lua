local utilities = {}

utilities.directions = {down = Vec2(0, 1), left = Vec2(-1, 0), right = Vec2(1, 0), up = Vec2(0, -1)}

local offset = Vec2(-1, -1)
function utilities.convertToDrawn(position)
    return (position + offset) * TILE_WIDTH
end

function utilities.convertToReal(drawn)
    return ((drawn / TILE_WIDTH) - offset):floor()
end

function utilities.between(a, b)
    local distance = a:distance(b)
    if distance == 0 then return sequence{} end

    local direction = (b - a):orthogonal()
    local positions = sequence{}

    for i = 1, distance do
        positions:push(a + (i * direction)) 
    end

    return positions
end

return utilities

