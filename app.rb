require 'bundler'
require'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

while player1.life_points > 0 && player2.life_points > 0

	puts "Voici l'état de chaque joueur"
	puts player1.show_state
	puts player2.show_state 
	puts "Maintenant BASTON"

	puts player1.attacks(player2)
		break	if player2.life_points <= 0 
	puts player2.attacks(player1)
	

end
binding.pry