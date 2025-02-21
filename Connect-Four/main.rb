# frozen_string_literal: true

require_relative 'lib/board'

board = Board.new

board.place(3, :red)
board.place(3, :blue)
board.print_board
