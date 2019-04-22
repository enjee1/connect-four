require_relative "board_space"

class GameBoard
  attr_reader :board, :stop_play

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
    @stop_play = false
  end

  def rows
    @board
  end

  def add_turn(player, col_choice)
    col_index = column_letter_index(col_choice)

    if !column_full?(col_index)
      @board.reverse.each do |row|
        if row[col_index].to_char == "-"
          row[col_index].player = player
          game_winner?(player)
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

  def column_letter_index(column_letter)
    COLUMN_NAMES.find_index(column_letter.upcase)
  end

  def winner_horizontal?(player)
    victory = false

    @board.reverse_each do |row|
      spaces_string = row.map { |space| space.to_char }.join("")
      # row is an array of BoardSpace objects
      if spaces_string.include?(winning_sequence(player))
        victory = true
        break
      else
        victory = false
      end
    end
    victory
  end

  def winner_vertical?(player)
    victory = false

    columns_as_rows_array = []

    col_index = 0
    while col_index < @board.size
      @board.to_enum.with_index.reverse_each do |row, row_index|
        columns_as_rows_array << @board[row_index][col_index]
      end
      col_index += 1
    end

    spaces_string = ""
    columns_as_rows_array.each do |space|
      spaces_string += "#{space.to_char}"
      if spaces_string.include?(winning_sequence(player))
        victory = true
        break
      else
        victory = false
      end
    end
    @stop_play = victory
  end

  def winning_sequence(player)
    winning_sequence = ""

    4.times do
      winning_sequence += player.piece
    end

    winning_sequence
  end

  def game_winner?(player)
    @stop_play = false
    if winner_horizontal?(player) || winner_vertical?(player)
       @stop_play = true
    else
      @stop_play = false
    end
    @stop_play
  end
end
