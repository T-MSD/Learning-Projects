# frozen_string_literal: true

# Board Class
class Board
  attr_reader :board, :symbols

  def initialize
    @board = Array.new(6) { Array.new(7, nil) }
    @symbols = {
      red: '🔴',
      blue: '🔵'
    }
  end
end
