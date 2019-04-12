require "spec_helper"

describe GameBoard do
  let(:board) { GameBoard.new }

  it "is a grid of 10 rows with 10 spaces in each row" do
    expect(board.rows.size).to eq(10)
    expect(board.rows[0].size).to eq(10)
  end

  it "fills the starting board with dashes and labels each column A - J" do
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

    expect(board.print_out).to eq(printed_game_board)
  end

  it "creates a map of the column letters to a number represntation" do
    column_hash = {
      "A" => 0,
      "B" => 1
    }
    expect(board.column_indexes).to eq(column_hash)
  end

end
