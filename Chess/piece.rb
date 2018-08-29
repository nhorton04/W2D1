require_relative 'modules.rb'
require 'singleton'

class Piece
  attr_reader :color, :board, :pos

  def initialize(color = nil, board = nil, pos = nil)
    @color = color
    @board = board
    @pos = pos
  end



  def to_s; end

  def empty?; end

  def valid_moves; end

  def pos=(val); end

  def symbol
    "X"
  end

  def inspect
    "X"
  end

  private

  def move_into_check; end

end

class NullPiece < Piece
  include Singleton

  def symbol
    " "
  end

  def inspect
    "O"
  end

end

class Bishop < Piece
  include SlidingPiece

  def initialize(color = nil, board = nil, pos = nil)
    super
  end

  def move_dirs
    "diagonal"
  end

  def symbol
    if color == :white
      '♗'
    else
      '♝'
    end
  end

end

class Queen < Piece
  include SlidingPiece

  def initialize(color = nil, board = nil, pos = nil)
    super
  end


  def move_dirs
    "both"
  end

  def symbol
    if color == :white
      '♕'
    else
      '♛'
    end
  end

end

class Rook < Piece
  include SlidingPiece

  def initialize(color = nil, board = nil, pos = nil)
    super
  end

  def move_dirs
    "horizontal"
  end

  def symbol
    if color == :white
      '♖'
    else
      '♜'
    end
  end

end

class Knight < Piece
  include SteppingPiece

  def initialize(color = nil, board = nil, pos = nil)
    super
  end

  def symbol
    if color == :white
      '♘'
    else
      '♞'
    end
  end

end

class Pawn < Piece

  def initialize(color = nil, board = nil, pos = nil)
    super
  end

  def symbol
    if color == :white
      '♙'
    else
      '♟'
    end
  end
end

class King < Piece
  include SteppingPiece

  def initialize(color = nil, board = nil, pos = nil)
    super
  end

  def symbol
    if color == :white
      '♔'
    else
      '♚'
    end
  end

end
