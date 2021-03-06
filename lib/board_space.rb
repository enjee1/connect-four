class BoardSpace
  attr_accessor :player

  def occupied?
    !@player.nil?
  end

  def to_char
    if @player
      @player.piece
    else
      '-'
    end

  end
end
