require_relative 'piece.rb'
require 'byebug'
require 'colorize'
require 'colorized_string'
require_relative 'cursor.rb'
require_relative 'display.rb'
class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    populate_board
  end

  def move_piece(start_pos, end_pos)
    # start_pos = [0,0] end_pos = [0,0]
    raise "No piece at start" if self[start_pos].is_a?(NullPiece)
    raise "Piece cannot move to end position" if self[end_pos] == nil
    current_piece = self[start_pos]
    self[end_pos] = current_piece
    self[start_pos] = NullPiece.instance
  end

  def populate_board
    2.times do |row|
      (0..7).each do |col|
        self[[row, col]] = Piece.new
      end
    end

    (6..7).each do |row|
      (0..7).each do |col|
        self[[row, col]] = Piece.new
      end
    end
  end



  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  dis = Display.new(board)
  dis.render
end
