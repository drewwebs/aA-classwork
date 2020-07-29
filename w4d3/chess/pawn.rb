require_relative "piece"

class Pawn < Piece
    
    def symbol
        '♟️'.colorize(@color)
    end

    def moves
        forward_steps + side_attacks 
    end


    private
    def at_start_row? #determine start row based on color
        (@pos[0] == 1 && @color == "White") || (@pos[0] == 6 && @color == "Black")
    end

    def forward_dir #
        if @color == "White"
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if at_start_row?
            return [ [@pos[0] + 2 * forward_dir, @pos[1]] , [@pos[0] + forward_dir, @pos[1]] ]
        else
            return [@pos[0] + forward_dir, @pos[1]]
        end
    end

    def side_attacks
        attack_moves = []
        pos0 = self.pos[0]
        pos1 = self.pos[1]
        diagonal_positions = [[pos0 + forward_dir, pos1 + 1],[pos0 + forward_dir, pos1 - 1]] 
        
        diagonal_positions.each do |diag|
            attack_moves << diag if (self.board[diag].color != self.color) && !self.board[diag].color.nil? #check if it is nullpiece
        end
        attack_moves
    end



end