class Queen < Piece

    include Slideable

    def symbol
        @symbol = :Q
    end

    def move_dirs
        [[1,0], [-1,0], [0,1], [0,-1], [1,1], [1,-1], [-1,-1], [-1,1]]
    end


end