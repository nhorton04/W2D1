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
        if row == 1
          self[[row, col]] = Pawn.new(:black,self,[row,col])
        else
          if col == 0 || col == 7
            self[[row,col]] = Rook.new(:black,self,[row,col])
          elsif col == 1 || col == 6
            self[[row,col]] = Knight.new(:black,self,[row,col])
          elsif col == 2 || col == 5
            self[[row,col]] = Bishop.new(:black,self,[row,col])
          elsif col == 3
            self[[row,col]] = Queen.new(:black,self,[row,col])
          else
            self[[row,col]] = King.new(:black,self,[row,col])
          end
        end
      end
    end

    self[[3,4]] = Rook.new(:black,self,[3,4])

    (6..7).each do |row|
      (0..7).each do |col|
        if row == 6
          self[[row,col]] = Pawn.new(:white,self,[row,col])
        else
          if col == 0 || col == 7
            self[[row,col]] = Rook.new(:white,self,[row,col])
          elsif col == 1 || col == 6
            self[[row,col]] = Knight.new(:white,self,[row,col])
          elsif col == 2 || col == 5
            self[[row,col]] = Bishop.new(:white,self,[row,col])
          elsif col == 3
            self[[row,col]] = Queen.new(:white,self,[row,col])
          else
            self[[row,col]] = King.new(:white,self,[row,col])
          end
        end
      end
    end
  end

  def show_valid_moves(pos)
    self[pos].moves
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
  p board.show_valid_moves([3,4])
  dis = Display.new(board)
  #dis.render
end
