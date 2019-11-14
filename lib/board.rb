# Use this as a sketch of how your Board class could look, you can fill in these
# methods, or make a different class from scratch
require 'tty-table'

class Board
  attr_reader :table
  attr_accessor :columns

  def initialize
    generate_board
  end

  def drop_checker(color, column_index)
    column = @columns[column_index]
    unless column.kind_of?(Array)
      return false 
    end
    for index in 0..column.size do
      if column[index+1].nil? or not column[index+1].empty?
        if column[index].empty?
          column[index] = color
          @columns[column_index] = column

          return true
        else 
          return false
        end
      end
    end
    return false
  end

  def generate_board
    columns = []
    7.times do
      columns << []
    end

    columns.each do |r|
      6.times do
        r << empty_string
      end
    end
    @columns = columns
  end

  def empty_string
    "".freeze
  end

  def headers
    [0, 1, 2, 3, 4, 5, 6]
  end

  def print_grid
    rows = @columns.transpose
    @table = TTY::Table.new headers, rows
    puts @table.render(:ascii, padding: [1, 2, 1, 2])
  end

  def game_won?
    horizontal = @columns.transpose
    game_won_vertical(@columns) or game_won_vertical(horizontal) or game_won_diagonal(@columns)
  end

  def game_won_vertical(columns)
    columns.each do |column|
      winning_player = nil
      streak = 0
      previous_cell = nil
      column.each do |cell|
        if !cell.empty? and previous_cell == cell 
          streak += 1
          winning_player = cell
          if streak == 3
            return true
          end
        end
        previous_cell = cell
      end
    end
    return false
  end 


  def game_won_diagonal(columns)
    return false
  end

end
