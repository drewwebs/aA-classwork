require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board 
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return board.won? && (self.board.winner != evaluator)
    end

    if self.next_mover_mark == evaluator
      return self.children.all? {|child| child.losing_node?(evaluator)}
    else
      return self.children.any? {|child| child.losing_node?(evaluator)}
    end


  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end
      
    if self.next_mover_mark == evaluator
      return self.children.any? {|child| child.winning_node?(evaluator)}
    else
      return self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  def show
    self.board.rows.each { |row| p row }
  end

  # This method generates an array of all moves that can be made after
  # the current move.


  
  def children
    children = []
    @board.rows.each.with_index do |row, x|
      row.each.with_index do |pos,y| 
        if board.empty?([x,y])
          new_board = board.dup
          new_board[[x, y]] = self.next_mover_mark
          switched_mark = (@next_mover_mark == :x) ? :o : :x 
          children << TicTacToeNode.new(new_board, switched_mark, [x,y])
        end
      end
    end
    children
  end
  
  # def children
  #   poss_boards = [self]
  #   until poss_boards.empty?
  #     debugger
  #     poss_boards += add_kids(poss_boards.shift.board)
  #   end
  # end

  # def add_kids(kid)
  #   switch_turns
  #   kids = []
  #   kid.rows.each.with_index do |row, x|
  #     row.each.with_index do |pos,y| 
  #       if kid.empty?([x,y])
  #         new_board = kid.dup
  #         new_board[[x, y]] = self.next_mover_mark
  #         kids << TicTacToeNode.new(new_board, self.next_mover_mark, [x,y])
  #       end
  #     end
  #   end

  #   kids.each do |child| 
  #     puts child.show
  #     puts
  #   end

  #   kids
  # end


end



a = TicTacToeNode.new(Board.new,:x)
# p a.children

    # def dfs(target_value)
    #     return self if self.value == target_value
        
    #     if !@children.empty? 
    #         @children.each do |child| 
    #             a = child.dfs(target_value)
    #             return a if a != nil 
    #         end
    #     end

    #     nil
    # end