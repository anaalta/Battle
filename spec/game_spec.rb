require './lib/game'
require './lib/player'

describe Game do
 subject(:game){ described_class.new(player1,player2)}
 let(:player1) {double :player}
 let(:player2) {double :player}

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

end
