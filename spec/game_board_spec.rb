require "spec_helper"

describe GameBoard do

  let(:board) { GameBoard.new}
  let(:o_player) { Player.new("Sally", 'O') }
  let(:x_player) { Player.new("John", 'X') }

  describe "#initialize" do
    it "is a grid of 10 rows with 10 spaces in each row" do
      expect(board.rows.size).to eq(10)
      expect(board.rows[0].size).to eq(10)
    end

    it "has empty spaces when created" do
      expect(board.empty_spaces?).to eq(true)
    end
  end

  describe "#print" do
    it "fills the starting board with dashes and labels each column A - J and
      dispalys the empty board" do

      printed_game_board =
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      "|-  -  -  -  -  -  -  -  -  -|\n" +
      " A  B  C  D  E  F  G  H  I  J " + "\n"

      expect(board.print).to eq(printed_game_board)
    end
  end

  describe "#column_letter_index" do
    it "returns a numerical representation of the players column
      letter choice" do
      expect(board.column_letter_index('A')).to eq(0)
      expect(board.column_letter_index('J')).to eq(9)
    end
  end

  describe "#column_full?" do
    it "returns false if the column selected by the player is empty or has
      spaces remaining for additional game pieces" do
      index = board.column_letter_index('D')
      expect(board.column_full?(index)).to eq(false)

      5.times do
        board.add_turn(o_player, 'A')
      end
      index = board.column_letter_index('A')
      expect(board.column_full?(index)).to eq(false)
    end

    it "returns true if the column selected by the player is full of
      game pieces" do
      10.times do
        board.add_turn(o_player, 'G')
      end
      index = board.column_letter_index('G')
      expect(board.column_full?(index)).to eq(true)

    end
  end

  describe "#add_turn" do
    it "adds the player game piece in the lowest available row of the column
      indicated by the player" do
      board.add_turn(o_player, 'A')
      board.add_turn(x_player, 'A')
      board.add_turn(o_player, 'C')
      board.add_turn(x_player, 'C')
      expect(board.rows[9][0].to_char).to eq("O")
      expect(board.rows[8][0].to_char).to eq("X")
      expect(board.rows[9][2].to_char).to eq("O")
      expect(board.rows[8][2].to_char).to eq("X")
    end
  end

  describe "#empty_spaces?" do
    it "has no empty spaces when completely occupied" do
      10.times do
        board.add_turn(o_player, 'A')
        board.add_turn(x_player, 'B')
        board.add_turn(o_player, 'C')
        board.add_turn(x_player, 'D')
        board.add_turn(o_player, 'E')
        board.add_turn(x_player, 'F')
        board.add_turn(o_player, 'G')
        board.add_turn(x_player, 'H')
        board.add_turn(o_player, 'I')
        board.add_turn(x_player, 'J')
      end

      puts "\n" + board.print
      expect(board.empty_spaces?).to eq(false)
    end
  end

  describe "#winner_horizontal?" do
    it "returns true if there are four consecutive game pieces of the same
      player in a row" do
      board.add_turn(x_player, 'A')
      board.add_turn(o_player, 'B')
      board.add_turn(x_player, 'C')
      board.add_turn(o_player, 'D')
      board.add_turn(x_player, 'A')
      board.add_turn(o_player, 'E')
      board.add_turn(x_player, 'A')
      board.add_turn(o_player, 'F')
      board.add_turn(x_player, 'B')
      board.add_turn(o_player, 'G')
      expect(board.winner_horizontal?(o_player)).to eq(true)
    end
    it "returns false if there no player has four consecutive pieces in the
      a row" do
      board.add_turn(o_player, 'A')
      board.add_turn(x_player, 'B')
      board.add_turn(o_player, 'C')
      board.add_turn(x_player, 'D')
      board.add_turn(o_player, 'E')
      board.add_turn(x_player, 'F')
      board.add_turn(o_player, 'G')
      board.add_turn(x_player, 'H')
      board.add_turn(o_player, 'I')
      board.add_turn(x_player, 'J')
      expect(board.winner_horizontal?(o_player)).to eq(false)
      expect(board.winner_horizontal?(x_player)).to eq(false)
      puts board.print
    end
  end


  describe "#vertical_winner?" do
    it "returns true if there are four consecutive game pieces of the same
      player in a column" do
    end

    it "returns true if there are four consecutive game pieces of the same
      player in a column" do
    end
  end
end
