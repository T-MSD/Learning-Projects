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

  def place(col, color)
    return 'Invalid Column' unless (0...7).cover?(col)

    row = nil
    5.downto(0) do |i|
      if @board[i][col].nil?
        row = i # Set row only when we find an empty spot
        break
      end
    end
    return 'Column is full' if row.nil?

    @board[row][col] = @symbols[color]
    puts(row)
    puts(@board[row][col])
  end

  def print_board
    @board.each do |row|
      puts "  " + row.map { |cell| cell.nil? ? "⚪" : cell }.join(" ")
    end
    puts
  end
end
