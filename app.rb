# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

#User.new
#julie = User.new("julie@email.com", 35)
#jean = User.new("jean@maimail.com", 22)

#my_event = Event.new("2019-01-13 09:00", 10, "standup quotidien", [julie, jean])

#my_event.age_analysis #j'exécute la nouvelle méthode que j'ai écrite

#binding.pry

player1 = Player.new("Josiane")
player2 = Player.new("José")


while player1.life_points >0 || player2.life_points >0
	puts"---------------------------------------------------------------------"
	player1.start_show
	puts"\n\n"
	player2.start_show
	puts"\n\n"
	Player.start_fight
	puts"----------------------------------------------------------------------"
	puts "\n"
	player1.attacks(player2)
	break if player2.life_points <= 0
	puts "\n"
	player2.attacks(player1)
	break if player1.life_points <= 0
end