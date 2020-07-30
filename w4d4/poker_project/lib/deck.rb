require_relative "card"
require "byebug"


class Deck
    SUITS = ["clubs", "spades", "hearts", "diamonds"]
    VALUES = {
        2 => 2,
        3 => 3,
        4 => 4,
        5 => 5,
        6 => 6,
        7 => 7,
        8 => 8,
        9 => 9,
        10 => 10,
        "J" => 11,
        "Q" => 12,
        "K" => 13,
        "A" => 14
}

    
    attr_reader :draw_pile
    
    
    def initialize 
        @draw_pile = []
        @discard = []
        create_deck
    end
    
    def create_deck
        VALUES.each do |key,val|
            SUITS.each do |suit|
                # debugger
                self.draw_pile << Card.new(key, suit, val)
            end
        end
    end

    def deck_shuffle 
        self.draw_pile.shuffle!
    end
end
