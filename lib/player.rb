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








#binding.pry
#puts "end of file"