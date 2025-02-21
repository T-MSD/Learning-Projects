# frozen_string_literal: true

# Board Class
class Board
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, nil) }
  end

  def place(col, color)
    return 'Invalid Column' unless (0...7).cover?(col)

    row = nil
    5.downto(0) do |i|
      if @board[i][col].nil?
        row = i
        break
      end
    end
    return 'Column is full' if row.nil?

    @board[row][col] = color
  end

  def board_full?
    @board[0].none?(&:nil?) # No nil in the top row means the board is full
  end

  def print_board
    @board.each do |row|
      puts '  ' + row.map { |cell| cell.nil? ? '⚪' : cell }.join(' ')
    end
    puts
  end
end
