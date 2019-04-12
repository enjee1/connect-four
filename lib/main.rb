# players
#   - have a unique name
#   - are assigned a game piece (either x or o)
#   - provide a column selection to place their game piece
#
# game board
#   - a 10 x 10 grid
#   - holds two kinds of game pieces (x, and o)
#   - pieces are added to a column of the board and are placed at the
#     bottom-most open space
#   - pieces can stack on top of other pieces regardless of whose piece is in
#     the bottom-most open space
#
# board spaces
#   - total of 100 spaces on a game board
#   - can be empty, occupied by an x, or occupied by an o
#
# round
#   - the game is played until one of two conditions are met
#     - game ends if the game board is full and results in a stalemate
#     - game ends when the first player places 4 game pieces in a row
#       horizontally or vertically
#
