class Space
  attr_accessor :color, :board_x, :board_y

  def initialize(board_x, board_y)
    self.board_x = board_x
    self.board_y = board_y
    self.color = :white
  end
end
