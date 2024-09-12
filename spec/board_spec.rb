require './lib/board'

describe Board do
  describe '#display_board' do
    it 'initializes as an array' do
      board = Board.new
      expect (board.board_array).should be_an_instance_of(Array) # rubocop:disable Style/RedundantParentheses
    end

    it 'initializes with space objects' do
      board = Board.new
      expect (board.board_array[0][0]).should be_an_instance_of(Space)
    end
  end

  describe '#add_marker' do
    it 'drops marker on bottom of empty board' do
      board = Board.new
      board.add_marker(3, :red)
      expect (board.board_array[5][3].color).should eql(:red) # rubocop:disable Style/RedundantParentheses
    end

    it 'drops marker on top of existing marker' do
      board = Board.new
      board.add_marker(3, :red)
      board.add_marker(3, :red)
      expect (board.board_array[5][3].color).should eql(:red)
    end

    it 'does not allow marker drop in full column' do
      board = Board.new
      board.add_marker(3, :red)
      board.add_marker(3, :red)
      board.add_marker(3, :red)
      board.add_marker(3, :red)
      board.add_marker(3, :red)
      board.add_marker(3, :red)
      expect {board.add_marker(3, :red)}.to output("Invalid move! Try again.\n").to_stdout
    end
  end
end
