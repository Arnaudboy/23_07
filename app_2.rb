require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "==========================="
puts "|Bienvenue dans mon jeux BRO|"
puts "|Soit le dernier SURVIVOR  |"
puts "==========================="

puts "Entre donc ton nom"
Human = Human_player.new(gets.chomp)
puts "Bienvenue #{gets.chomp} tu vas combattre nos redoutable José et Josiane."

player1 = Player.new("Josiane")
player2 = Player.new("Jose")