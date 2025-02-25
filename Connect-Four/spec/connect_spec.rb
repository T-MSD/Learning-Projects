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
    it 'placing a piece in the bottom row' do
      board.place(3, '🔴')
      expect(board.board[5][3]).to eq('🔴')
    end

    it 'placing a piece stacked on top of the first one' do
      board.place(3, '🔵')
      expect(board.board[4][3]).to eq('🔵')
    end

    it 'placing a piece in a full column' do
      6.times { board.place(1, '🔴') }
      expect(board.place(1, '🔴')).to eq('Column is full')
    end

    it 'placing a piece in an invalid column' do
      expect(board.place(-1, '🔴')).to eq('Invalid Column')
      expect(board.place(7, '🔴')).to eq('Invalid Column')
    end
  end

  describe '#board_full?' do
    board = Board.new
    it 'Returns false if board is not full' do
      expect(board.board_full?).to be false
    end

    it 'Returns true if board is full' do
      (0..6).each do |i|
        6.times { board.place(i, '🔴') }
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
      board.place(1, '🔴')
      expect(board.board_empty?).to be false
    end
  end

  describe '#reset_board' do
    it 'resets the board, every cell is nil' do
      board = Board.new
      board.place(3, '🔴')
      board.reset_board
      expect(board.board_empty?).to be true
    end
  end
end

# Player Tests
describe Player do
  describe '#initialize' do
    it 'creates an instance with desired color' do
      player = Player.new('🔵')
      expect(player.color).to eq('🔵')
    end
  end
end

# Game Tests
describe Game do
  player1 = Player.new('🔴')
  player2 = Player.new('🔵')
  describe '#initialize' do
    it 'creates a game instance' do
      board = Board.new
      game = Game.new(board, player1, player2)
      expect(game.p1.color).to eq('🔴')
      expect(game.p2.color).to eq('🔵')
    end
  end

  describe '#win?' do
    it 'horizontal win' do
      board = Board.new
      game = Game.new(board, player1, player2)
      (0..3).each do |i|
        board.place(i, '🔴')
      end
      expect(game.win?('🔴')).to be true
    end

    it 'vetical win' do
      board = Board.new
      game = Game.new(board, player1, player2)
      4.times { board.place(1, '🔴') }
      expect(game.win?('🔴')).to be true
    end

    it 'diagonal win "\"' do
      board = Board.new
      game = Game.new(board, player1, player2)
      (0..3).each do |i|
        board.board[i][i] = '🔴'
      end
      expect(game.win?('🔴')).to be true
    end

    it 'diagonal win "/"' do
      board = Board.new
      game = Game.new(board, player1, player2)
      5.downto(2) do |i|
        board.board[i][5 - i] = '🔴'
      end
      expect(game.win?('🔴')).to be true
    end
  end

  describe '#empty_col?' do
    board = Board.new
    it 'returns true if column is empty' do
      expect(board.empty_col?(1)).to be true
    end

    it 'returns false if column is full' do
      6.times { board.place(1, '🔴') }
      expect(board.empty_col?(1)).to be false
    end
  end

  describe '#reset?' do
    let(:player1) { double('Player', color: '🔴') }
    let(:player2) { double('Player', color: '🔵') }
    let(:board) { double('Board') }
    let(:game) { Game.new(board, player1, player2) }

    it 'returns true if input = yes' do
      allow(game).to receive(:gets).and_return("yes\n")
      expect(game.reset?).to be true
    end

    it 'returns true if input = yes' do
      allow(game).to receive(:gets).and_return("no\n")
      expect(game.reset?).to be false
    end
  end

  describe '#prompt' do
    player1 = Player.new('🔴')
    player2 = Player.new('🔵')
    board = Board.new
    game = Game.new(board, player1, player2)

    before do
      allow(game).to receive(:write) # Suppress console output
      allow(board).to receive(:empty_col?).and_return(true) # Default stub to avoid unexpected arguments
    end

    it 'returns valid row and column when input is correct' do
      allow(board).to receive(:empty_col?).with(2).and_return(true)
      allow(game).to receive(:gets).and_return("2\n")
      expect(game.prompt).to eq('2')
    end

    it 'rejects invalid column input and asks again' do
      allow(board).to receive(:empty_col?).with(2).and_return(true)
      allow(game).to receive(:gets).and_return("10\n", "2\n")
      expect(game.prompt).to eq('2')
    end

    it 'rejects occupied positions and asks again' do
      allow(game).to receive(:gets).and_return("2\n", "2\n")
      allow(board).to receive(:empty_col?).with(2).and_return(false, true) # First call = occupied, second call = valid
      expect(game.prompt).to eq('2') # Expect only the final valid input
    end
  end

  # Add play_round test
end
