class Card 
    attr_reader :suit, :value, :name
    def initialize(name, suit, val)
        @suit = suit 
        @value = val 
        @name = name
    end
end