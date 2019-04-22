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
puts "\n"
puts board.print
puts "\n"


while board.stop_play == false
  puts "Player 1, in which column would you like to place your game piece?"
  puts "Please specifiy a column letter:"
  print "> "
  p1_choice = gets.chomp
  board.add_turn(player_one, p1_choice)
  puts board.print
  puts "\n"
end
