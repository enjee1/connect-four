require_relative "game_board"
require_relative "player"
require_relative "game_turn"

board = GameBoard.new()

puts "Player 1, what is your name?"
name_one = gets.chomp
puts "Player 2, what is your name?"
name_two = gets.chomp

while name_one.downcase == name_two.downcase
  puts "That name is already taken. Player 2, please enter a unique name."
  name_two = gets.chomp
end

player_one = Player.new(name_one, "X")
player_two = Player.new(name_two, "O")

puts "Player 1 is named #{player_one.name} and is playing #{player_one.piece}s"
puts "Player 2 is named #{player_two.name} and is playing #{player_two.piece}s"

puts "Player 1, in which column would you like to place your game piece?"
puts "Please specifiy a column letter: "
print "> "


# - get player 1's column choice
# - check if the column is open
# - put the player 1 game piece in the column
# - update the board
#
# - get player 2's column choice
# - check if the column is open
# - put the player 2 game piece in the column
# - update the board
#
#   loop player choices until board is full or there is a winner
