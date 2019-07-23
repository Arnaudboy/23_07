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
  if user_input == "a"#Besoin d'un plus gros gun ?
    human.search_weapon
  elsif user_input == "s"#Besoin d'un petit remontant ?
    human.search_health_pack
  else user_input == 0 || user_input == 1#Attaque des bots, ici on garde des integers et pas des string car on s'en sert pour trouver un index du tableau ennemie
  	human.attacks(ennemies[user_input.to_i]) 
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