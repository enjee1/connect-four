require "spec_helper"

describe Player do
  it "has a name" do
    player = Player.new("John")
    expect(player.name).to eq("John")
  end
end
