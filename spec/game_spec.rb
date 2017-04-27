require_relative 'game'
require './lib/player'

describe Game do
 subject(:game){Game.new}
 let(:player) {double :player}

it 'takes method attack' do
  expect(subject).to respond_to(:attack).with(1).argument
end

 it 'reduced hp when attacked' do
   allow(player).to receive(:receives_damage)
   expect(subject.attack(player)).to eq (player.receives_damage)
 end
end
