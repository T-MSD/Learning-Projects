# frozen_string_literal: true

# Class Game
class Game
  attr_reader :colors, :winner, :board

  def initialize(board)
    @colors = {
      red: '🔴',
      blue: '🔵'
    }
    @board = board
    @winner = nil
  end

  def reset
    @board.reset_board
    @winner = nil
  end

  def check_four?(row, col, r_dir, c_dir, color)
    4.times.all? do |i|
      r = row + i * r_dir
      c = col + i * c_dir
      r.between?(0, 5) && c.between?(0, 6) && @board.board[r][c] == color
    end
  end

  def win?(color)
    6.times do |row|
      7.times do |col|
        return true if check_four?(row, col, 0, 1, color) ||
                       check_four?(row, col, 1, 0, color) ||
                       check_four?(row, col, 1, 1, color) ||
                       check_four?(row, col, 1, -1, color)
      end
    end
    false
  end
end
