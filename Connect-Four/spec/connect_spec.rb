# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  board = Board.new

  describe '#initialize' do
    it 'creates the board, 7x6 2d array' do
      expect(board.board).to be_an(Array)
      expect(board.board).to all(be_an(Array))
    end
  end

  describe '#place' do
    it 'placing a piece in the bottom row' do
      board.place(3, :red)
      expect(board.board[6][2]).to eq('🔴')
    end

    it 'placing a piece stacked on top of the first one' do
      board.place(3, :red)
      board.place(3, :blue)
      expect(board.board[6][2]).to eq('🔴')
      expect(board.board[5][2]).to eq('🔵')
    end

    it 'placing a piece in a full column' do
      6.times { board.place(1, :red) }
      expect { board.place(1, :red) }.to raise_error('Column is full')
    end

    it 'placing a piece in an invalid column' do
      expect { board.place(-1, :red) }.to raise_error('Invalid Column')
      expect { board.place(6, :red) }.to raise_error('Invalid Column')
    end
  end
end
