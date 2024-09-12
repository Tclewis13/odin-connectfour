require_relative 'lib/board'

board = Board.new

board.display_board(board.board_array)

board.add_marker(3, :red)
board.add_marker(3, :red)
board.add_marker(3, :red)
board.add_marker(3, :red)
board.add_marker(3, :red)
board.add_marker(3, :red)
board.add_marker(3, :red)

board.add_marker(1, :blue)
board.add_marker(1, :blue)
board.add_marker(1, :blue)

board.display_board(board.board_array)
