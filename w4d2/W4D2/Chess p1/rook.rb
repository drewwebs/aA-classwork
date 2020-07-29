class Rook < Piece

    include Slideable

    def symbol
        @symbol = :R
    end
    
    def move_dirs
        [[1,0], [-1,0], [0,1], [0,-1]]
    end


end