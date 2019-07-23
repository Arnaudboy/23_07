require 'bundler'
require'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "============================="
puts "|Bienvenue dans mon jeux BRO|"
puts "|Soit le dernier SURVIVOR   |"
puts "============================="

puts "Entre donc ton nom"
name = gets.chomp
human = Human_Player.new(name)
puts "Bienvenue #{name} tu vas combattre nos redoutable José et Josiane."

ennemies = [											#création de l'array ennemies
player1 = Player.new("Josiane"),
player2 = Player.new("Jose") ]

#-----------------------------------------------------------------------------------------------------------------------------------

while human.life_points >0 && (player1.life_points > 0 || player2.life_points >0) #condition d'arret de la boucle while

	puts "Voici ton état petit humain"
	puts human.show_state

	puts "Quelle action veux-tu effectuer ? \n\n"

	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner\n "

	puts "attaquer un joueur en vue :"
	puts "0 - #{player1.show_state} "
	puts "1 - #{player2.show_state}"
user_input = gets.chomp
  if user_input == "a"
    human.search_weapon
  elsif user_input == "s"
    human.search_health_pack
  elsif user_input == 0 || user_input == 1
  	human.attacks(ennemies[user_input.to_i]) #pas d'akternative si on tappe autre chose que les options demandées
  else !["a", "s", 0, 1] #Maintenant c'est fait
  	puts "Choisi parmi les options demandées. Tu perds un tour"
  end
#-------------------------------------------------------------------------------------------------------------------------------------  
  ennemies.each do |ennemy| #attaque de tous les ennemies
  	if ennemy.life_points > 0 #sauf les mort
  		ennemy.attacks(human)# A L'ATTAAAAAAAQUE
  	end
  end	
end

if human.life_points > 0
	puts "YOU WIN !"
else
	puts "YOU LOOSE"
end

binding.pry