class Player # Classe des players bots

attr_accessor :name, :life_points

	def initialize(name) #life_points est directement à 10
		@name = name
		@life_points = 10
	end

	def show_state #On entre Player1 ou 2 pour lire son niveau de vie
		"#{@name} a #{life_points} points de vie"
	end

  def gets_damage(int) #Il est temps de donné des coups
    @life_points = [@life_points - int, 0].max #Après plusieurs essai à un certain point du jeux @life_points = nil. Crée un tableau avec 2 valeurs me permet d'éviter cela en prenant une des deux valeurs du tabeau
    puts "Le joueur #{@name} a été tué !" if @life_points == 0 # THANKS CAPTAIN OBVIOUS
  end

	def attacks(player_attacked) #GROS BOUM BOUM
		puts "#{name} attaque #{player_attacked.name}\n"
		hit = compute_damage #On créé la variable pour éviter de se servir de compute_damage. A chaque compute_damage = un nouveau lancé de dé
		puts "#{name} à infligé #{hit} dommage à #{player_attacked.name}"
		player_attacked.gets_damage(hit) # Il en prend plein la tronche
	end

	def compute_damage #dé mystique du temps temporelle
    return rand(1..6)
  end

end

class Human_Player < Player #Nouvelle classe : ça c'est toi

	attr_accessor :weapon_level

	def initialize(name)# Initialize, nouvelle valeur de life_point + nouvelle variable de classe weapon_level
		super(name)#methode super merci Felix
		@weapon_level = 1
		@life_points = 100
	end

	def compute_damage #On va les sulfatter ces batards
    rand(1..6) * @weapon_level
  end

  def search_weapon#Besoin de plus de puissance de feu ?
  	level = rand(1..6)#niveau de l'arme choisi de manière aléatoire
  	puts "Tu as trouvé une arme de niveau #{level}"
  	if level > @weapon_level #Faudrait pas se retrouver avec une arme moins puissante que celle que nous avons déjà
  		@weapon_level = level
  	else
  	  puts "Goddam l'arme n'est pas meilleure" #Bro soit pas déçu
  	end	
  end

  def search_health_pack # Tu veux jouer aux infirmiers ?
        item = rand(1..6) #dé interplanétaire des soins divins
        if item  == 1#1ere condition
            puts "Tu n'as rien trouvé..."#sorry
        elsif item == (2..5)#2ème condition
            @life_points += 50 #oh yeah
            @life_points > 100 ? @life_points = 100 : @life_points#hep hep hep pas plus de 100 PV ok ?
            puts "Tu as trouvé une potion, +50 PV !"#THKS CAPTAIN OBVIOUS
        else 
            @life_points += 80#Même fonctionnement que précédement mais avec un plus gros bonus
            @life_points > 100 ? @life_points = 100 : @life_points
            puts "Tu as trouvé une super potion, +80 PV !"
        end 
    end 
end