require_relative 'board'
require 'colorize'

# This class is for initializing and running a game. It will
# need a new board and a way to keep track of who is the
# current player. The rest is up to you:
class Game
  def initialize
    @board = Board.new
    @players = ["O".colorize(:red), "O".colorize(:yellow), "O".colorize(:green), "O".colorize(:magenta)]
    @current_player = @players[0]
    @board.print_grid
  end

  def start
    puts 'A new game has begun!'
    @players.each do |player|
      @current_player = player
      @board.drop_checker(@current_player, 1)
    end
    @board.print_grid
  end
end
