module Stepable #pawn, king, knight

end



module Slideable #queen, rook, bishop
    private
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,-1], [-1,1] ]
    HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]

    public
    def moves(start_pos, directions) #directions ex [up, right]
        poss_moves = []

    end
    
    

end