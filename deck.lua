local Object = require "lib.classic"

local Deck = Object:extend()

function Deck:new(cards)
    self.cards = cards
    pretty.print(cards)
end

return Deck
