module SlidingPiece
  def moves
    case move_dirs
    when "both"
      self.pos
    when "diagonal"

    when "horizontal"
      current_pos = self.pos.dup
      current_pos[0] += 1
      moves = []
      until self.board[current_pos].class != NullPiece || current_pos[0] == 7
        moves += [current_pos.dup]
        current_pos[0] += 1
      end
      current_pos = self.pos.dup
      current_pos[0] -= 1
      until self.board[current_pos].class != NullPiece || current_pos[0] == 0
        moves += [current_pos.dup]
        current_pos[0] -= 1
      end
      current_pos = self.pos.dup
      current_pos[1] -= 1
      until self.board[current_pos].class != NullPiece || current_pos[1] == 0
        moves += [current_pos.dup]
        current_pos[1] -= 1
      end
      current_pos = self.pos.dup
      current_pos[1] += 1
      until self.board[current_pos].class != NullPiece || current_pos[1] == 7
        moves += [current_pos.dup]
        current_pos[1] += 1
      end
      return moves
    end
  end

  def move_dirs; end
end

module SteppingPiece
  def moves

  end
end
