require_relative "board_space"

class GameBoard
  attr_reader :board

  COLUMN_NAMES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']

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

  def add_turn(player, col_choice)
    column_index = COLUMN_NAMES.find_index(col_choice.upcase)
    @board[0][column_index].player = player
  end

  def available_row

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
    board_print + format_column_names
  end

  def format_column_names
    result = ""
    COLUMN_NAMES.each do |letter|
      result += " #{letter} "
    end
    result
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
