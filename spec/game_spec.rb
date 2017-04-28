require './lib/game'
require './lib/player'

describe Game do
 subject(:game){ described_class.new(player1,player2)}
 let(:player1) {double :player, hp: 100}
 let(:player2) {double :player, hp: 100}

it 'takes method attack' do
  expect(game).to respond_to(:attack).with(1).argument
end

 it 'reduced hp when attacked' do
   allow(player1).to receive(:receives_damage)
   expect(game.attack(player1)).to eq (player1.receives_damage)
 end

 it 'accepts two players' do
    expect(game.player1).to eq(player1)
    expect(game.player2).to eq(player2)
 end

describe '#switch_turns' do
  it 'switches turns between the players' do
    allow(player1).to receive(:receives_damage)
    game.attack(player1)
    expect(game.switch_turns).to eq [player2]
  end
end

  describe "game_over?" do
    it "returs false if no one has reached 0 hp" do
      expect(game.game_over?).to eq false
    end

    it "returns true if one player reaches 0 hp" do
      expect(game.lost?).to eq true
    end
  end

end
