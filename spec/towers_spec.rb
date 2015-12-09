require 'towers'

describe "Game" do
  subject(:game) { Game.new }

  let(:original_board) { game.board }
  let(:non_winning_board) { [ [], [5, 4, 3], [2, 1] ]}

  describe "#won?" do
    let(:winning_board) { [[], [], [5, 4, 3, 2, 1] ]}

    it "returns true on a winning board" do
      game.board = winning_board
      expect(game).to be_won
    end

    it "returns false on a non-winning board" do
      game.board = non_winning_board
      expect(game).to_not be_won
    end
  end

  describe "#move" do

    # it "receives input from user" move(start, fin)

    it "removes the disk from start tower and places it on the destination tower" do

      start_tower, dest_tower = game.board[0], game.board[1]
      start_height, dest_height = start_tower.count, dest_tower.count
      game.move(0,1)

      expect(start_tower.count).to eq(start_height - 1)
      expect(dest_tower.count).to eq(dest_height + 1)

    end

    it "can't move a bigger disk on top of a smaller disk" do

      game.board = non_winning_board

      expect{ game.move(1, 2) }.to raise_error(TowerError)
    end


    it "can't pick up a disk from an empty tower" do
      expect{ game.move(1, 2) }.to raise_error(TowerError)
    end

    it "raises an error if you input nonexist towers" do
      expect{ game.move(1, 3) }.to raise_error(TowerError)
      expect{ game.move(3, 1) }.to raise_error(TowerError)
    end

  end

  describe "#render" do
    it "prints out the board" do
      expect(game.render).to eq(nil)
    end
  end




end
