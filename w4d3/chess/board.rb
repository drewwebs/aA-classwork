require_relative "requirer"
require "byebug"

class Board
    attr_accessor :grid
    
    def initialize
        @sentinel = NullPiece.instance
        @grid = Array.new(8) {Array.new(8,@sentinel)}
        @grid.each_with_index do |row,i|
            row.each_with_index do |space,j|
                if i == 0 || i == 1
                    color = "White"
                elsif i == 6 || i == 7
                    color = "Black"
                end
                @grid[i][j] = Pawn.new(color,self,[i,j]) if [1,6].include?(i)
                @grid[i][j] = Rook.new(color,self,[i,j]) if [[0,0],[7,0],[0,7],[7,7]].include?([i,j])
                @grid[i][j] = Knight.new(color,self,[i,j]) if [[0,1],[0,6],[7,1],[7,6]].include?([i,j])
                @grid[i][j] = Bishop.new(color,self,[i,j]) if [[0,2],[0,5],[7,2],[7,5]].include?([i,j])
                @grid[i][j] = Queen.new(color,self,[i,j]) if [[0,3],[7,3]].include?([i,j])
                @grid[i][j] = King.new(color,self,[i,j]) if [[0,4],[7,4]].include?([i,j])
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
        
        if self[start_pos].moves.include?(end_pos)
            self[start_pos], self[end_pos] = @sentinel, self[start_pos]
            self[end_pos].pos = end_pos
        else
            raise MoveError
        end
    end

    def valid_pos?(start_pos, end_pos)
        return false if self[start_pos].class == NullPiece
        return false if !(0..7).include?(end_pos[0]) || !(0..7).include?(end_pos[1])
        return false if self[end_pos].color == self[start_pos].color
        true
    end

    class MoveError < StandardError
        def initialize(msg="That's not a valid move")
            super(msg)
        end
    end
    
end