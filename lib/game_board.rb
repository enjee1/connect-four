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
      # TODO: create an error message without using puts method
      puts "\n"
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      puts "ERROR: This column is full! Choose another column."
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      puts "\n"
    end
    winner_horizontal?(player)
  end

  def column_full?(column)
    !@board.map { |row| row[column] }.any? { |space| space.to_char == "-"}
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
    board_print + format_column_names + "\n"
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

  def winner_horizontal?(player)
    victory = false
    winning_sequence = ""
    4.times do
      winning_sequence += player.piece
    end

    @board.reverse_each do |row|
      spaces_string = row.map { |space| space.to_char }.join("")
      if spaces_string.include?(winning_sequence)
        victory = true
        break
      else
        victory = false
      end
    end
    victory
  end

  def game_winner?

  end
end
