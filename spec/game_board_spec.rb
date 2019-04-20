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
      " A  B  C  D  E  F  G  H  I  J "

      expect(board.print).to eq(printed_game_board)
    end
  end

  it "has empty spaces when created" do
    expect(board.empty_spaces?).to eq(true)
  end

  it "has no empty spaces when completely occupied" do
    board.add_turn(o_player, 'A')
    board.add_turn(x_player, 'B')    
    puts board.print
    expect(board.empty_spaces?).to eq(false)
  end
end
