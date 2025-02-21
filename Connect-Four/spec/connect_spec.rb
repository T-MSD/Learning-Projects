# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

# Board Tests
describe Board do
  describe '#initialize' do
    board = Board.new
    it 'creates the board, 7x6 2d array' do
      expect(board.board).to be_an(Array)
      expect(board.board).to all(be_an(Array))
    end
  end

  describe '#place' do
    board = Board.new
    game = Game.new(board)
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
    game = Game.new(board)
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

  describe '#board_empty?' do
    it 'returns true for an empty board ' do
      board = Board.new
      expect(board.board_empty?).to be true
    end

    it 'returns false if at least one piece is placed' do
      board = Board.new
      game = Game.new(board)
      board.place(1, game.colors[:red])
      expect(board.board_empty?).to be false
    end
  end

  describe '#reset_board' do
    it 'resets the board, every cell is nil' do
      board = Board.new
      game = Game.new(board)
      board.place(3, game.colors[:red])
      board.reset_board
      expect(board.board_empty?).to be true
    end
  end
end

# Player Tests
describe Player do
  describe '#initialize' do
    it 'creates an instance with desired color' do
      board = Board.new
      game = Game.new(board)
      player = Player.new(game.colors[:blue])
      expect(player.color).to eq('🔵')
    end
  end
end

# Game Tests
describe Game do
  describe '#initialize' do
    it 'creates a game instance' do
      board = Board.new
      game = Game.new(board)
      expect(game.colors[:red]).to eq('🔴')
      expect(game.colors[:blue]).to eq('🔵')
    end
  end

  describe '#reset' do
    board = Board.new
    game = Game.new(board)
    board.place(1, game.colors[:red])
    game.reset
    it 'Overides the 2d array' do
      expect(board.board).to be_an(Array)
      expect(board.board).to all(be_an(Array))
    end

    it 'resets board and winner' do
      expect(board.board_empty?).to be true
      expect(game.winner).to be nil
    end
  end

  describe '#is_win?' do
    it 'horizontal win' do
      board = Board.new
      game = Game.new(board)
      (0..3).each do |i|
        board.place(i, game.colors[:red])
      end
      expect(game.is_win?).to be true
    end

    it 'vetical win' do
      board = Board.new
      game = Game.new(board)
      4.times { board.place(1, game.colors[:red]) }
      expect(game.is_win?).to be true
    end

    it "diagonal win '\'" do
      board = Board.new
      game = Game.new(board)
      (0..3).each do |i|
        board[i][i] = '🔴'
      end
      expect(game.is_win?). to be true
    end

    it "diagonal win '/'" do
      
    end
  end
end
