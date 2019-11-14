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
    while !@board.game_won?
      @players.each do |player|
        @current_player = player
        print "Player #{player} - please choose a column: "

        until @board.drop_checker(@current_player, get_column) do 
          puts "Invalid column selection"
          print "Player #{player} - please choose a different column: "

          column_input = gets.chomp
        end 
         
        @board.print_grid

        if @board.game_won?
          break
        end
      end
    end

    puts "#{@current_player} has won the game!"
  end

  def get_column
    begin
      column_input = gets.chomp
      column = Integer(column_input)
    rescue 
      print "Please choose a valid column number: "
      get_column
    end
  end
end
