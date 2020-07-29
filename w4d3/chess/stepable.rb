module Stepable
    
    public
    def moves
        poss_moves = []
        move_diffs.each do |diff| 
            new_pos = [diff[0] + self.pos[0], diff[1] + self.pos[1] ]
            poss_moves << new_pos if self.board.valid_pos?(self.pos, new_pos)
        end 
        poss_moves
    end
    
    private    
    def move_diffs
        raise NotImplementedError
    end
end