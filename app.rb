require 'bundler'
require'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

while player1.life_points > 0 && player2.life_points > 0 #condition d'arret de la boucle

	puts "Voici l'état de chaque joueur"
	puts player1.show_state #Affichage des points de vies des joueurs
	puts player2.show_state 
	puts "Maintenant BASTON"

	puts player1.attacks(player2) #Attaque de player1
		break	if player2.life_points <= 0 #On vérifié que Shanka des Rasta Rocket ne soit pas mort
	puts player2.attacks(player1)	#Player2 attaque

end
binding.pry