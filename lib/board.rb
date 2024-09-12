require_relative 'space'
require 'colorize'
require 'pry-byebug'

class Board
  attr_accessor :board_array

  def initialize
    self.board_array = Array.new(6) { Array.new(7) }
    self.board_array = setup_spaces(board_array)
  end

  def setup_spaces(board_array)
    board_array.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        board_array[row_index][column_index] = Space.new(row_index, column_index)
      end
    end
    board_array
  end

  def display_board(board_array)
    board_array.each do |row|
      puts ''
      row.each do |column|
        print '[]'.colorize(column.color)
      end
    end
    puts ''
  end

  def invalid_move
    puts 'Invalid move! Try again.'
  end

  def add_marker(board_x, color)
    invalid_move if board_array[0][board_x].color != :white
    i = 5
    while i >= 0
      if board_array[i][board_x].color == :white
        board_array[i][board_x].color = color
        break
      end
      i -= 1
    end
  end
end
