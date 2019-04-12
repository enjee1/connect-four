require_relative "game_turn"

class GameBoard
  attr_reader :column_indexes

  CONNECT_FOUR_ROW_SIZE = 10
  COLUMN_LETTERS = ["A", "B", "C", "D", "E", "F", "G", "H",
     "I", "J"]

  def initialize
    @board = []
    CONNECT_FOUR_ROW_SIZE.times do
      row = []
      CONNECT_FOUR_ROW_SIZE.times do
        row << nil
      end
      @board << row
    end

    @column_indexes = map_columns
  end

  def add_turn

  end

  def rows
    @board
  end

  def print_out
    game_screen = ""
    @board.each do |row|
      row.each_with_index do |spot, index|
        if index == 0
          game_screen += "|- "
        elsif index == row.size - 1
          game_screen += " -|\n"
        else
          game_screen += " - "
        end
      end
    end
    game_screen + label_columns
  end

  def map_columns
    columns = {}
    COLUMN_LETTERS.each_with_index do |letter, index|
      columns[index] = letter
    end
    columns
  end
end

def label_columns
  column_names = ""
  COLUMN_LETTERS.each do |letter|
    column_names += " #{letter} "
  end

  column_names
end
