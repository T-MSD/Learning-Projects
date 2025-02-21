# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game'

describe Board do
  describe '#initialize' do
    board = Board.new
    it 'creates the board, 7x6 2d array' do
      expect(board.board).to be_an(Array)
      expect(board.board).to all(be_an(Array))
    end
  end

  describe '#place' do
    game = Game.new
    board = Board.new
    it 'placing a piece in the bottom row' do
      board.place(3, game.colors[:red])
      expect(board.board[5][3]).to eq('🔴')
    end

    it 'placing a piece stacked on top of the first one' do
      board.place(3, game.colors[:blue])
      expect(board.board[4][3]).to eq('🔵')
    end

    it 'placing a piece in a full column' do
      6.times { board.place(1, game.colors[:red]) }
      expect(board.place(1, :red)).to eq('Column is full')
    end

    it 'placing a piece in an invalid column' do
      expect(board.place(-1, :red)).to eq('Invalid Column')
      expect(board.place(7, :red)).to eq('Invalid Column')
    end
  end

  describe '#board_full?' do
    board = Board.new
    game = Game.new
    it 'Returns false if board is not full' do
      expect(board.board_full?).to be false
    end

    it 'Returns true if board is full' do
      (0..6).each do |i|
        6.times { board.place(i, game.colors[:red]) }
      end
      expect(board.board_full?).to be true
    end
  end
end
