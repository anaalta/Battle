
class Game

  def initialize(player1, player2)
    @players = [player1, player2]
    @turn = player1

  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack(player)
    player.receives_damage
  end

  def switch_turns
    @players.select { |player| player != @turn }
  end

  def game_over?
      losing_players.any?
  end

  def lost?
    losing_players.each { |player| player.hp == 0 } ? true : false
  end

    # private

  def losing_players
    @players.select { |player| player.hp <= 0 }
  end

end
