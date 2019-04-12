class GameBoard
  CONNECT_FOUR_ROW_SIZE = 10

  def initialize
    @board = []
    CONNECT_FOUR_ROW_SIZE.times do
      row = []
      CONNECT_FOUR_ROW_SIZE.times do
        row << nil
      end
      @board << row
    end
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
    game_screen + label_columns!
  end

  def label_columns!
    column_letters = [" A ", " B ", " C ", " D ", " E ", " F ", " G ", " H ",
       " I ", " J "]
    column_names = column_letters.join("")
    column_names
  end
end
