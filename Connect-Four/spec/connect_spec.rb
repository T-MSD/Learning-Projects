# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  board = Board.new

  describe '.initialize' do
    it 'creates the board, 7x6 2d array' do
      expect(board.board).to be_an(Array)
      expect(board.board).to eq([])
    end
  end
end
