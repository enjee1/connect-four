class GameTurn
  attr_reader :board, :player, :col_index

  def initialize(board, player, col_index)
    @board =  board
    @player = player
    @col_index = col_index
  end
end
