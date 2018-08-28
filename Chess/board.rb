require_relative 'piece.rb'
require 'byebug'
class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) {Array.new(8,nil)}
  end

  def move_piece(start_pos, end_pos)
    # start_pos = [0,0] end_pos = [0,0]
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    raise "No piece at start" if !@grid[start_row][start_col].is_a?(Piece)  
    raise "Piece cannot move to end position" if @grid[end_row][end_col].is_a?(Piece)
  end
  
  def populate_board
    
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
  piece = Piece.new
  piece2 = Piece.new
  board.grid[7][7] = piece2
  board.grid[0][0] = piece
  board.move_piece([0,0],[7,7])
end