require './lib/space'

describe Space do
  describe 'initialize' do
    it 'initializes board_x' do
      space = Space.new(2,4)
      expect(space.board_x).to eql(2)
    end

    it 'initializes board_y' do
      space = Space.new(2,4)
      expect(space.board_y).to eql(4)
    end

    it 'initializes color' do
      space = Space.new(2,4)
      expect(space.color).to eql(:white)
    end
  end
end
