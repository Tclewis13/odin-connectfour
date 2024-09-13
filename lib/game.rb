require 'pry-byebug'

class Game
  attr_accessor :turn, :turns_passed, :win, :board

  def initialize(board)
    self.board = board
    self.turn = :red
    self.turns_passed = 0
    self.win = nil

    puts 'Connect four! Game begins. Red goes first, then blue.'
    board.display_board(board.board_array)
    game_flow(turn, self.board)
  end

  def game_flow(turn, board)
    move = get_move(turn)
    row = board.add_marker(move, turn)
    board.display_board(board.board_array)

    if turn == :red
      turn = :blue
    elsif turn == :blue
      turn = :red
    end
    check_for_win(move, row)
    game_flow(turn, board)
  end

  def get_move(turn)
    puts "#{turn} player, input row for your move."
    gets.chomp.to_i
  end

  def check_for_win(column, row)
    if check_vertical_win(column, row)
      puts "#{turn} wins!"
      exit!
    end
    if check_horizontal_win(column, row)
      puts "#{turn} wins!"
      exit!
    end
    if check_diagonol_ascending(column, row)
      puts "#{turn} wins!"
      exit!
    end
    if check_diagonol_descending(column, row) # rubocop:disable Style/GuardClause
      puts "#{turn} wins!"
      exit!
    end
  end

  def check_diagonol_ascending(column, row)
    count = 1
    current_column = column
    current_row = row

    while current_column < 6 && current_row > 0
      current_column += 1
      current_row -= 1
      break if @board.board_array[current_row][current_column].color != @turn

      count += 1
    end
    current_column = column
    current_row = row
    while current_column > 0 && current_row < 5
      current_column -= 1
      current_row += 1
      break if @board.board_array[current_row][current_column].color != @turn

      count += 1
    end
    count >= 4
  end

  def check_diagonol_descending(column, row)
    count = 1
    current_column = column
    current_row = row

    while current_column > 0 && current_row > 0
      current_column -= 1
      current_row -= 1
      break if @board.board_array[current_row][current_column].color != @turn

      count += 1
    end
    current_column = column
    current_row = row
    while current_column < 5 && current_row < 5
      current_column += 1
      current_row += 1
      break if @board.board_array[current_row][current_column].color != @turn

      count += 1
    end
    count >= 4
  end

  def check_horizontal_win(column, row)
    count = 1
    current_column = column

    while current_column < 6
      current_column += 1
      break if @board.board_array[row][current_column].color != @turn

      count += 1
    end
    current_column = column
    while current_column > 0
      current_column -= 1
      break if @board.board_array[row][current_column].color != @turn

      count += 1
    end
    count >= 4
  end

  def check_vertical_win(column, row)
    return false if row > 2

    count = 1
    current_row = row
    while current_row <= 4 && count < 5
      current_row += 1
      return false if @board.board_array[current_row][column].color != @turn

      count += 1
    end
    true
  end
end
