require './game.rb'
require './player.rb'


player = Player.new()

Game.new(player).play
