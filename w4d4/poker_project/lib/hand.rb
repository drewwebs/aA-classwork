

class Hand
    TIERS = {
        garbage => 0
        doubles => 1
        two_pair => 2
        triples => 3
        straight => 4
        flush => 5
        full_house => 6
        quads => 7
        straight_flush => 8
        royal_flush => 9
}

    def initialize(hand)
        @hand = hand
        @values = []
    end

    def check_value
        count = []
        
        @hand.each_with_index do |card1,i|
            @hand.each_with_index do |card2,j|
                if i > j && card1.value == card2.value
                    count << card1 if !count.include?(card1)
                    count << card2 if !count.include?(card2)
                end
            end    
        end
        case count.length
        when 0
            return tiers[garbage]
        when 2
            return tiers[doubles]
        when 3
            return tiers[triples]
        when 4
            initial = count[0].value
            count.all? {|card| card.value = initial } ? return tiers[quads] : return tiers[two_pair]
        else
            if straight? && !flush?
                return tiers[straight]
            elsif !straight? && flush?
                return tiers[flush]
            elsif full_house?
                return tiers[full_house]
            elsif royal_flush?
                return tiers[royal_flush]
            else
                return tiers[straight_flush]
            end
        end

        

        end
    end
end