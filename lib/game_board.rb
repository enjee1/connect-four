require_relative "board_space"

class GameBoard
  attr_reader :board

  def initialize(num_rows_and_columns = 10)
    @board = []
    num_rows_and_columns.times do
      row = []
      num_rows_and_columns.times do
        row << BoardSpace.new
      end
      @board << row
    end
  end

  def rows
    @board
  end

  def add_turn(player, col_index)

  end

  def print
    board_print = ""
    @board.each do |row|
      row.each_with_index do |spot, index|
        if index == 0
          board_print += "|- "
        elsif index == row.size - 1
          board_print += " -|\n"
        else
          board_print += " - "
        end
      end
    end
    board_print + " A  B  C  D  E  F  G  H  I  J "
  end

  def empty_spaces?
    @board.each do |row|
      row.each do |space|
        return true if !space.occupied?
      end
    end
    return false
  end

  def winner?
    false
  end
end
