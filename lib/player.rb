require "pry"

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		if name.is_a?(String) 
    	@name = name
    	@life_points = 10
    else
      puts "WARNING ! your chosen player is not a player. Please picka damn good player ;)" #si l’e-mail ne passe pas le check => message d'erreur
    end
  end

  def show_state # display player state
  	puts "#{@name} has #{@life_points} life points"
  end

  def gets_damage(nb_damage_received) # get damaged by dropping lifepoints of the player
  	if nb_damage_received.is_a?(Integer) 
  		@life_points = @life_points - nb_damage_received
  	else 
  		puts "come on it's tuesday free damage"
  	end
  	if @life_points <= 0
  			puts " DAMN WHAT A PUNCH!!!! RIP #{@name} is DEAD"
  	end	
  end

  def attacks(player2) # fighting time beetween two players
  	puts "#{self.name} attacks #{player2.name}"
  	punch = self.compute_damage
  	player2.gets_damage(punch)
  	puts "#{self.name} causes #{punch} injuries to #{player2.name}"
  end

   def compute_damage # the number of damage is given randomly
    return rand(1..6)
  end

  def start_show # descripton of each player
  	puts "Here is the description of the player"
    puts ">	Player : #{@name}"
    self.show_state
  end

  def self.start_fight # starting punching 
  	puts "Bingooo Let's fight:"
  end

end


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@weapon_level = 1
		super(name) #fait appel au initialize de la classe Player avec #Super
		@life_points = 100
	end

	def show_state
		puts "#{super} and weapon level of #{@weapon_level}"
	end

	def compute_damage
    super * @weapon_level
  end

  def search_weapon
  	new_weapon_level = rand(1..6)
  	puts"A weapon level of #{new_weapon_level} has been found"
  	if new_weapon_level > @weapon_level 
  		puts"OMG that one is monster, I'll keep it"
  		@weapon_level = new_weapon_level
  	else
  		puts"Puff I'll keep the old one"
  	end
  end

  def search_health_pack
  	new_life_points = rand(1..6)
  	puts"life points of #{new_life_points} have been found"
  	if new_life_points == 1
  		puts"SORRY ! you found an empty health pack"
  	end 
  	if new_life_points >= 2 || new_life_points <=5 
  		puts"LUCKY ! you found an health pack of 50 life points"
  		@life_points = @life_points + 50 unless @life_points > 50 
  	end
  	if new_life_points == 6
  		puts"FUCKING LUCKY ! you found an health pack of 80 life points"
  		@life_points = @life_points + 50 unless @life_points > 20 
  	end
  end

end





#binding.pry
#puts "end of file"