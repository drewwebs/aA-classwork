module Slideable #queen, rook, bishop
    attr_reader :DIAGONAL_DIRS, :HORIZONTAL_DIRS
    
    private
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,-1], [-1,1] ]
    HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]

    public
    def moves #directions ex [up, right]
        poss_moves = []
        move_dirs.each do |dir|
            poss_moves += grow_unblocked_moves(dir[0], dir[1])
        end
        poss_moves
    end
    
    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves(dy, dx)
        moves = []
        current_pos = @pos
        unblocked = true
        # debugger
        while unblocked
            y,x = current_pos[0] + dy, current_pos[1] + dx
            current_pos = [y,x]
            other_piece = self.board[current_pos]

            if self.board.valid_pos?(self.pos, current_pos) && other_piece.class == NullPiece
                moves << current_pos
            elsif self.board.valid_pos?(self.pos, current_pos) && other_piece.color != self.color
                moves << current_pos
                unblocked = false
            else
                unblocked = false
            end
        end
        moves
    end

end