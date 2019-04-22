require "spec_helper"

describe GameTurn do
  let(:board) { GameBoard.new}
  let(:player) { Player.new("John", "O") }
  let(:col_choice) { 0 }
  let(:turn) { GameTurn.new(board, player, col_choice) }

  it "has a board" do
    expect(turn.board).to eq(board)
  end

  it "has a player" do
    expect(turn.player).to eq(player)
  end

  it "has a column index" do
    expect(turn.col_choice).to eq(col_choice)
  end
end
