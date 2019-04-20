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

    if !column_full?(column_index)
      @board.reverse.each do |row|
        if row[column_index].to_char == "-"
          row[column_index].player = player
          break
        end
      end
    else
      "This column is full! Choose another column."
    end
    binding.pry 
  end

  def column_full?(column)
    !@board.map { |row| row[column] }.any? { |space| space.to_char == "-"}
    # columns = @board.map { |row| row[column] }
    # result = !columns.any? { |space| space.to_char == "-"}
    # result
  end

  def print
    board_print = ""
    @board.each do |row|
      row.each_with_index do |spot, index|
        if index == 0
          board_print += "|#{spot.to_char} "
        elsif index == row.size - 1
          board_print += " #{spot.to_char}|\n"
        else
          board_print += " #{spot.to_char} "
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
