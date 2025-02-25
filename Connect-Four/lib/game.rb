# frozen_string_literal: true

# Class Game
class Game
  attr_reader :board, :p1, :p2

  def initialize(board, player1, player2)
    @board = board
    @p1 = player1
    @p2 = player2
  end

  def reset
    @board.reset_board
    play
  end

  def reset?
    puts 'Start a new game?'
    input = gets.chomp
    until %w[yes no].include?(input)
      puts 'Type either yes or no.'
      input = gets.chomp
    end
    return false if input == 'no'

    true if input == 'yes'
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

  def valid_input?(input)
    if !input.to_i.between?(0, 6)
      puts 'Invalid number, column has to be a number between 0 and 6.'
      return false
    elsif !@board.empty_col?(input)
      puts 'Column is already full!'
      return false
    end
    true
  end

  def prompt
    puts 'Enter col:'
    c = gets.chomp
    until valid_input?(c.to_i)
      puts 'Enter col:'
      c = gets.chomp
    end
    c.to_i
  end

  def play_round
    players = [@p1, @p2]
    turn = 0
    loop do
      if @board.board_full?
        puts "It's a tie!"
        break
      end
      col = prompt
      current_player = players[turn % 2]
      @board.place(col, current_player.color)
      @board.print_board
      if win?(current_player.color)
        puts "#{current_player.color} Wins!"
        break
      end
      turn += 1
    end
  end

  def play
    puts 'First player -> Red color'
    puts 'Second player -> Blue color'
    play_round
    reset if reset?
  end
end
