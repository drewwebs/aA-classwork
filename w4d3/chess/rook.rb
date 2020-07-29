require_relative "piece"
require_relative "slideable"

class Rook < Piece

    include Slideable

    def symbol
        '♜'.colorize(@color)
    end
    
    def move_dirs
        HORIZONTAL_DIRS
    end


end