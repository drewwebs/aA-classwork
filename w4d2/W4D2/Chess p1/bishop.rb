class Bishop < Piece
    include Slideable

    def symbol
        @symbol = :B
    end

    def move_dirs
        [[1,1], [1,-1], [-1,-1], [-1,1] ]
    end



end