# frozen_string_literal: true

# Game rules
# Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any dead cell with exactly three live neighbours becomes a live cell.

def game_rules(neighbors, cell)
  result = '.'

  if cell == '*'
    result = if neighbors < 2
               '.'
             elsif neighbors > 3
               '.'
             else
               '*'
             end
  end
  result = '*' if (cell == '.') && (neighbors == 3)
  result
end

def count_neighbors(grid, row, col)
  neighbors = 0

  (-1..1).each do |k|
    # Contador de vecinos cells de la row arriba
    neighbors += 1 if (row - 1 >= 0) && (col + k >= 0) && col + k < grid[0].length && (grid[row - 1][col + k] == '*')

    # Contador de vecinos cells de la row de en medio
    if (row >= 0) && (col + k >= 0) && col + k < grid[0].length && (col + k != col) && (grid[row][col + k] == '*')
      neighbors += 1
    end

    # Contador de vecinos cells de la row de abajo
    next unless (row + 1 < grid.length) && (col + k >= 0) && (col + k < grid[0].length)

    neighbors += 1 if grid[row + 1][col + k] == '*'
  end
  neighbors
end

def main
  puts 'Enter number of rows and columns '
  puts ''
  input = gets.chomp.split(' ')
  rows = input[0].to_i
  cols = input[1].to_i

  grid = []

  puts 'Enter Grid '
  puts ''
  rows.times do
    grid.append(gets)
  end

  grid_aux = Array.new(rows) { '.' * cols }

  (0..grid.length - 1).each do |i|
    (0..grid[i].length - 1).each do |j|
      neighbors = count_neighbors(grid, i, j)
      grid_aux[i][j] = game_rules(neighbors, grid[i][j])
    end
  end

  puts ' New generation'
  puts ''
  puts grid_aux
end

main
