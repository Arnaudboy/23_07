class Game

	attr_accessor :human_player, :ennemies


	def initialize(name)
		@human_player = Human_Player.new(name)

		@ennemies = [											#création de l'array ennemies
		player1 = Player.new("Josiane"),
		player2 = Player.new("Jose"),
		player3 = Player.new("Josita"), 
		player4 = Player.new("Jitano")]
	end

	def kill_player(player) #supprimer les ennemis de l'array
		@ennemies.reject! {|ennemy| ennemy == player} #reject! = on garde dans l'array tout les true
	end
		
	def is_still_ongoing #Tu parles anglais ?
		@human_player.life_points > 0 && !@ennemies.empty? # On test un boolean true or false le ! indique que nous voulons l'inverse de .empty? pour ce dernier je t'invite à aller voir sur devdocs.com
	end

	def show_player #Moi je parle pas trop anglais je me contente de mettre les noms de methode que dis Felix
	  puts @human_player.show_state #Shanka t'es mort man ?
		puts "Il reste #{@ennemies.length} ennemie(s)"# nombre d'ennemie(s) restant
	end

	def menu
		i = 0 #définition d'une variable qui nous sert plus bas
		puts "Quelle action veux-tu effectuer ? \n\n" #CA c'est pas de l'anglais

		puts "a - chercher une meilleure arme"#GROS BOUM BOUM ?
		puts "s - chercher à se soigner\n "#Pas d'infirmière faut te dermerder mec

		puts "attaquer un bot :"#t'es là pour ça bro
			@ennemies.each do |ennemy|#on a besoin d'afficher tous les ennemies donc on defini une variable ennemy
				puts "#{i} - #{ennemy.show_state} "#le i défini plus haut nous sert ici, on indique quelle touche tapper pour fracasser un bot
		 		i += 1#on onblie pas d'incrementer sinon on aura que des 0
			end
	end

	def menu_choice
		user_input = gets.chomp#saisie du joueur
  	if user_input == "a"#Besoin d'un plus gros gun ?
    	@human_player.search_weapon
  	elsif user_input == "s"#Besoin d'un petit remontant ?
    	@human_player.search_health_pack
  	else #Attaque des bots, ici on garde des integers et pas des string car on s'en sert pour trouver un index du tableau ennemie
  		@human_player.attacks(ennemies[user_input.to_i]) 
  			if ennemies[user_input.to_i].life_points == 0 #faut virer les morts en gardant en tête qu'ils représentent des indexs dans notre array @ennemies
  				kill_player(ennemies[user_input.to_i])
  			end
  	end
  end

  def ennemies_attack
  	@ennemies.each do |ennemy| #attaque de tous les ennemies
  	  if ennemy.life_points > 0 #sauf les mort
  			ennemy.attacks(@human_player)# A L'ATTAAAAAAAQUE
  		end
  	end	
  end

  def end_game# On apprends l'anglais ensemble ?
  	if @human_player.life_points > 0
			puts "YOU WIN !"#YEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEES
		else
			puts "YOU LOOSE"#GODDAAAAAAM
		end
  end	
end	
