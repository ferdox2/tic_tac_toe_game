module TicTacToeGame
MSG_ENTER_COORDINATES = 'Enter coordinates in the form of x,y'
MSG_BOARD_VIEW = 'This is how the matrix looks like' 
MSG_DRAW_GAME = 'The game is draw, try again please.'
NUM_ROWS, NUM_COLUMNS = 3, 3
  class Board
    attr_reader :board

    def initialize(rows, columns)
      @board = Array.new(rows) { Array.new(columns, ' ') }
    end

    def display_board
      str = []
      str << "-----"
      str << @board.map { |row| row.join(' ') }
      str << "-----"
      str.join("\n")
    end

    def player_winning?(side)
      is_player_winning_based_on_rows(side) || is_player_winning_based_on_columns(side) || is_player_winning_based_on_diagonals(side)
    end

    def record_move(coordinates, side)
      @board[coordinates.first.to_i][coordinates.last.to_i] = side
    end

    def are_elements_equal(array, element)
      array.all? { |e| e == element }
    end

    def is_player_winning_based_on_rows(side)
      @board.any? { |row| are_elements_equal(row, side) }
    end

    def is_player_winning_based_on_columns(side)
      @board.transpose.any? { |row| are_elements_equal(row, side) }
    end

    def is_player_winning_based_on_diagonals(side)
      [@board[0][0], @board[1][1], @board[2][2]].all? { |e| e == side } ||
      [@board[0][2], @board[1][1], @board[2][0]].all? { |e| e == side }
    end
    def read_input
      $stdin.gets.chomp # fyi, when running from the command line, 'gets' will automatically read from $stdin
    end
    
    def read_players_info
      puts 'Welcome to Tic Tac Toe Game'
      puts 'Enter the name for the first player: '
      first_player_name = read_input
      puts 'Enter the name for the second player: '
      second_player_name = read_input
      first_player_index = 1
      if first_player_index == '1'
        [Player.new(first_player_name, 'X'), Player.new(second_player_name, 'O')]
      else
        [Player.new(second_player_name, 'X'), Player.new(first_player_name, 'O')]
      end
    end
    
    def read_player_move(board, player)
      puts board
      puts "Hello #{player}"
      player_input = nil
      until player_input do
        puts MSG_ENTER_COORDINATES
        player_input = get_input.strip.match /([012])\s*,\s*([012])/
      end
      board.record_move(player_input.captures, player.side)
      if board.player_winning?(player.side)
        puts "Congatulations #{player}, You Won!"
        return true
      end
      false
    end
  end
end
