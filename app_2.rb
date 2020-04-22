# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


puts"--------------------------------------------"
puts"\n"
puts"|WELCOME to the 'Jungle Game'  !           |"
puts"\n"
puts"|The last surviver wins the game  !         |"
puts"\n\n"
puts"--------------------------------------------"

puts"\n\n\n"
puts"Hey Yoo what's your name please ?"
print"<"
#nom = gets.chomp.to_s
humanplayer1 = HumanPlayer.new(gets.chomp.to_s)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies =Array.new
enemies << player1 << player2


while humanplayer1.life_points >0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)
  puts"---------------------------------------------------------------------"
	humanplayer1.start_show
	puts"---------------------------------------------------------------------"
	puts"\n\n"
	puts"Choose below any actions you prefer ! DON'T FORGET the last surviver wins the game :)"
	puts"\n"
	puts"a - chercher une meilleure arme"
	puts"s - chercher à se soigner "
	puts"\n\n"
	puts"attaquer un joueur en vue :"
	puts"0 - Josiane a 10 points de vie"
	puts"1 - José a 10 points de vie"
	puts"\n\n"
	puts"2 - Les autres joueurs t'attaquent"
	puts"\n\n"
	print"<"

	x = gets.chomp
	case x
		when "a" 
			humanplayer1.search_weapon
			
		when "s" 
			humanplayer1.search_health_pack

		when "0"
			puts"\n\n"
			puts"I'm gonna attack you bitch, show them who you are"
			puts"\n\n"
			player1.start_show
			puts"\n\n"
			Player.start_fight
			puts"\n\n"
			humanplayer1.attacks(player1)
			puts"---------------------------------------------------------------------"
			break if player1.life_points <= 0

		when "1"
			puts"\n\n"
			puts"I'm gonna attack you bitch, show them who you are"
			puts"\n\n"
			player2.start_show
			puts"\n\n"
			Player.start_fight
			puts"\n\n"
			humanplayer1.attacks(player2)
			puts"---------------------------------------------------------------------"
			break if player2.life_points <= 0	


		when "2"
			puts"\n\n"
			puts"Haha they attacking me ! who are you?"
			puts"\n\n"
			enemies.each do |i|
				i.start_show
				puts"\n\n"
				Player.start_fight
				puts"\n\n"
				i.attacks(humanplayer1)
				puts"---------------------------------------------------------------------"
				break if humanplayer1.life_points <= 0	
			end
		
	end
	#break if player1.life_points <= 0
	#break if player1.life_points <= 0	
end








