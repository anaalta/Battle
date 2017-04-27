require 'player'

describe Player do
subject (:player){Player.new(name)}
let(:name) {double :name}

  it 'has a name' do
    expect(player.name).to eq name
  end

  it 'has hit points' do
    expect(player.hp).to eq 100
  end

  it 'reduced hp when attacked' do
  expect{player.receives_damage}.to change{player.hp}.by(-10)
  end


end
