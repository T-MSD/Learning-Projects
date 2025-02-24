# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'

board = Board.new
game = Game.new(board)
a = game.prompt
puts(a)
