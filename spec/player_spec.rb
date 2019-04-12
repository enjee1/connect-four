require_relative "spec_helper"

describe Player do
  it "has a name" do
    player = Player.new("John", "X")
    expect(player.name).to eq("John")
  end

  it "has a game piece" do
    player = Player.new("Sally", "O")
    expect(player.piece).to eq("O")
  end
end
