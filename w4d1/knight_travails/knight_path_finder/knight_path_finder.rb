require_relative "00_tree_node.rb"  
require "byebug"

class KnightPathFinder
    #make a class constant that DELTAS = []
    def self.valid_moves(pos)
      row, col = pos 
      valid_moves = []
      [-1, 1, 2, -2].each_with_index do |el1,idx1|
        [-1, 1, 2, -2].each_with_index do |el2,idx2|
            if idx2 != idx1 && el1 + el2 != 0
                valid_moves << [el1 + row, el2 + col]
            end
        end
      end
      valid_moves.select {|ele| ele[0] >= 0 && ele[0] <=7 && ele[1] >= 0 && ele[1] <= 7}
    end

    attr_reader :root_node

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        @position = pos
    end

    def new_move_positions(pos)
        new_move = KnightPathFinder.valid_moves(pos).select {|ele| !@considered_positions.include?(ele)}
        @considered_positions.concat(new_move)
        return new_move 
    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_pos)
        path = []

        until end_pos == @root_node
            path.unshift(end_pos)
            end_pos = end_pos.parent
        end

        path.unshift(@root_node)

        path
    end

    def build_move_tree
        arr = [@root_node]
        
        until arr.empty?
            first_ele = arr.shift
            # debugger
            new_moves = new_move_positions(first_ele.value)
            new_moves.each {|ele| first_ele.add_child(PolyTreeNode.new(ele))}
            arr += first_ele.children
        end

        return arr
    end

end

a = KnightPathFinder.new([0,0])



kpf = KnightPathFinder.new([0, 0])
kpf.build_move_tree
p kpf.find_path([5, 1]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([7, 3]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


