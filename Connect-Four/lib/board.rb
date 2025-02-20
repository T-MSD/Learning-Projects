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

  def col_full?(col)
    @board.all? { |row| !row[col].nil? }
  end

  def place(col, color)
    return 'Invalid Column' unless (0...7).cover?(col)

    return 'Column is full' if col_full?(col)

    row = 0
    (0..5).each do |i|
      row = i
      break if @board[i][col].nil?
    end
    @board[row][col] = @symbols[color]
  end
end
