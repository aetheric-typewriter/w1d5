require_relative 'tic_tac_toe'


class TicTacToeNode

attr_reader :board, :next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
      @board = board
      @next_mover_mark = next_mover_mark
      @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    size = 3
    board_arr = []

    (0...3).each do |i|
      (0...3).each do |j|
        board_copy = board.dup
        if board_copy.empty?([i, j])
          board_copy[[i, j]] = next_mover_mark 
          board_arr << board_copy 
        end
      end
    end
     oposite_mover_mark = @next_mover_mark == :o ? :x : :o  

    board_arr.map {|b| TicTacToeNode.new(b , )}
  end
end
