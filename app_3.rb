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
my_game = Game.new(name)
puts "Bienvenue #{name} tu vas combattre nos redoutables bots!!!"

while my_game.is_still_ongoing
my_game.show_player
my_game.menu
my_game.menu_choice
my_game.ennemies_attack
end
my_game.end_game

binding.pry