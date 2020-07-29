class Knight < Piece
    include Stepable

    def symbol
        @symbol = :N
    end

    def move_diffs
        [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,1]]
    end
end