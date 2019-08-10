require_relative 'tic_tac_toe_game/version'
require_relative 'tic_tac_toe_game/board'
require_relative 'tic_tac_toe_game/player'

module TicTacToeGame
  class Error < StandardError; end
  # Your code goes here...

  board = Board.new(NUM_ROWS, NUM_COLUMNS)

  # Ruby will automatically dereference an array.  It is not necessary to break this into mutiple statements
  x_player = Player.new.read_players_info
  y_player = Player.new.read_players_info

  while true
    # this is just the same logic for both players
    # instead, I have moved the logic for a single player into the 'get_player_move' function and we call it twice
    break if read_player_move(board, x_player)
    break if read_player_move(board, y_player)
  end
end
