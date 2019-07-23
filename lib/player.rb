class Player

attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		"#{@name} a #{life_points} points de vie"
	end

	def gets_damage(damage)
		life_points = @life_points
		life_points -= damage
			puts "#{name} est DEAD" if @life_points <= 0
	end

	def attacks(player_attacked)
		puts "#{name} attaque #{player_attacked.name}\n"
		hit = compute_damage
		puts "#{name} à infligé #{hit} dommage à #{player_attacked.name}"
		player_attacked.life_points = gets_damage(hit)
	end

	def compute_damage
    return rand(1..6)
  end

end

class Human_Player < Player

	attr_accessor :weapon_level

	def initialize(name)
		@weapon_level = 1
		@life_points = 100
		super(name)
	end

	def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
  	weapon_level == rand(1..6)
  	puts "Tu as trouvé une arme de niveau #{weapon_level}"
  	weapon_level > @weapon_level ? weapon_level = @weapon_level : @weapon_level = @weapon_level	
  end

  def search_health_pack
        item = rand(1..6)
        if item  == 1
            puts "Tu n'as rien trouvé..."
        elsif item == (2..5)
            @life_points += 50
            @life_points > 100 ? @life_points = 100 : @life_points
            puts "Tu as trouvé une potion, +50 PV !"
        else 
            @life_points += 80
            @life_points > 100 ? @life_points = 100 : @life_points
            puts "Tu as trouvé une super potion, +80 PV !"
        end 
    end 
end