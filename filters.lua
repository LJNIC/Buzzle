local filters = {}

function filters.alive(object)
    print(object.alive)
    return object.alive
end

function filters.dead(object)
    return not object.alive
end

function filters.position(position)
    return function(object)
        return object.position == position
    end
end

function filters.equal(a)
    return function(b)
        return a == b
    end
end

function filters.draw(object)
    object:draw()
end

return filters
