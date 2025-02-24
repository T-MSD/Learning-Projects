# frozen_string_literal: true

# Class Game
class Game
  attr_reader :winner, :board, :p1, :p2

  def initialize(board, player1 = nil, player2 = nil)
    @board = board
    @winner = nil
    @p1 = player1
    @p2 = player2
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

  # TODO: Refactor this func
  def prompt
    text = ['Enter row:', 'Enter column:']
    coord = []
    i = 0
    while i < 2
      puts text[i]
      input = gets.chomp
      if i.zero? && input.to_i.between?(0, 5)
        i += 1
        coord.append(input.to_i)
      elsif i == 1 && input.to_i.between?(0, 6)
        i += 1
        coord.append(input.to_i)
        unless @board.empty_cell?(coord[0], coord[1])
          i = 0
          coord = []
          puts 'Position not empty!'
        end
      else
        puts 'Invalid number, row between 0 and 5, column between 0 and 6'
      end
    end
    coord
  end
end
