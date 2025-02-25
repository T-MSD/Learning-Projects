# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('🔴')
player2 = Player.new('🔵')
board = Board.new
game = Game.new(board, player1, player2)
game.play
