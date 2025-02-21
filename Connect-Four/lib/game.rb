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
end
