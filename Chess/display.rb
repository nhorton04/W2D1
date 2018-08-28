require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    previous_input = @cursor.cursor_pos
    next_input = nil
    until previous_input == next_input
      system("clear")
      puts "\n\n"
      (0..7).each do |row|
        # where cursor is, should do something different
        (0..7).each do |col|
          if @cursor.cursor_pos == [row,col]
            print " #{@board[[row,col]].inspect} ".colorize(:background => :red)
          else
            print " #{@board[[row,col]].inspect} ".colorize(:background => :yellow)
          end
        end
        puts
      end
      puts "\n\n"
      previous_input = next_input.dup
      next_input = @cursor.get_input
    end
  end
end
