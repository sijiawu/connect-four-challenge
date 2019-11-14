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
    for index in 0..column.size do
      if column[index+1].nil? or not column[index+1].empty?
        column[index] = color
        @columns[column_index] = column
        return true
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
    false
  end
end
