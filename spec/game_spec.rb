require './lib/game'
require './lib/board'

describe Game do
  describe 'initialize' do
    xit 'initializes board correctly' do
      board = Board.new
      game = Game.new(board)
      expect (game.board.board_array).should be_an_instance_of(Array)
    end

    xit 'initializes turn correctly' do
      board = Board.new
      game = Game.new(board)
      expect (game.turn).should eql(:red)
    end
  end

  describe '#game_flow' do
      xit 'calls and accepts red move' do
      board = Board.new
      game = Game.new(board)
      allow(game.get_move).to receive(:gets).and_return('0')
      expect(board.board_array[5][0].color).should eql(:red)
    end

    xit 'passes turn' do
      board = Board.new
      game = Game.new(board)
      expect(game.turn).should match(:blue)
    end
  end
end