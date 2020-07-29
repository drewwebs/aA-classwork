require_relative "piece"
require 'Singleton'

class NullPiece < Piece
    attr_reader :color, :symbol
    include Singleton

    def initialize
        @symbol = :N
        @color = nil
    end

    def moves
    end
    
end