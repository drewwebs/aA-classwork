class Pawn < Piece
    
    def symbol
        @symbol = :P
    end

    def move_dirs
        [[1,0]]
    end


    private
    def at_start_row? #determine start row based on color
        (@pos[0] == 1 && @color == :White) || (@pos[0] == 6 && @color == :Black)
    end

    def forward_dir #
        if @color == :White
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if at_start_row?
            return [1,2]
        else
            return [1]
        end
    end

    def side_attacks
        attack_moves = []
        pos0 = self.pos[0]
        pos1 = self.pos[1]
        diagonal_positions = [[pos0 + self.forward_dir, pos1 + 1],[pos0 + self.forward_dir, pos1 - 1]] 
        
        diagonal_positions.each do |diag|
            attack_moves << diag if (diag.color != self.color) && !diag.color.nil? #check if it is nullpiece
        end
        attack_moves
    end



end