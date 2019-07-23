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

ennemies = [
player1 = Player.new("Josiane"),
player2 = Player.new("Jose") ]

while human.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

	puts "Voici ton état petit humain"
	puts human.show_state

	puts "Quelle action veux-tu effectuer ? \n\n"

	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner\n "

	puts "attaquer un joueur en vue :"
	puts "0 - Josiane a #{player1.show_state} points de vie"
	puts "1 - José a #{player2.show_state} points de vie"
user_input = gets.chomp
  if user_input == "a"
    human.search_weapon
  elsif user_input == "s"
    human.search_health_pack
  else user_input == 0 || user_input == 1
  	human.attacks(ennemies[user_input.to_i])
  end
  
  ennemies.each do |ennemy|
  	if ennemy.life_points > 0
  		ennemy.attacks(human)
  	end
  end	
end

if human.life_points > 0
	puts "YOU WIN !"
else
	puts "YOU LOOSE"
end

binding.pry