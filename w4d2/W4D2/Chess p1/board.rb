require_relative "nullpiece.rb"
require_relative "piece.rb"

class Board
    attr_accessor :grid
    
    def initialize
        @sentinel = NullPiece.new
        @grid = Array.new(8) {Array.new(8,@sentinel)}
        @grid.each_with_index do |row,i|
            row.each_with_index do |space,j|
                @grid[i][j] = Piece.new if [0,1,6,7].include?(i)
            end
        end
    end

    def [](pos)
        x,y = pos
        @grid[x][y]
    end

    def []=(pos,value)
        x,y = pos
        @grid[x][y] = value
    end

    def move_piece(start_pos, end_pos)
        if valid_pos?(start_pos, end_pos)
            self[start_pos], self[end_pos] = @sentinel, self[start_pos]
        else
            raise("Not a valid move")
        end
    end

    def valid_pos?(start_pos, end_pos)
        return false if start_pos.class == NullPiece
        return false if !(0..7).include?(end_pos[0]) || !(0..7).include?(end_pos[1])
        return false if self[end_pos].class != NullPiece
        true
    end

    
end