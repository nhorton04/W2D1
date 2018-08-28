
require 'singleton'

class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s; end

  def empty?; end

  def valid_moves; end

  def pos=(val); end

  def symbol; end

  private

  def move_into_check; end

  def inspect
    "X"
  end

end

class NullPiece < Piece
  include Singleton

  def inspect
    "O"
  end

end

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    "diagonal"
  end

end

class Queen < Piece
  include SlidingPiece

  def move_dirs
    "both"
  end

end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    "horizontal"
  end

end

class Knight < Piece
  include SteppingPiece

end

class King < Piece
  include SteppingPiece

end
