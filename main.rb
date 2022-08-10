# Game rules
# Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any dead cell with exactly three live neighbours becomes a live cell.

def game_rules(neighbors, cell)

  result = '.'

  if cell == '*'
    if neighbors < 2
      result = '.'
    elsif neighbors > 3
      result = "."
    else 
      result = '*'  
    end 
  end
  if cell == '.' and neighbors == 3
    result = '*'   
  end
  return result
end

def count_neighbors(grid, row, col)
  neighbors = 0
  
  for k in -1..1 
    # Contador de vecinos cells de la row arriba 
    if row - 1 >= 0 and col + k >= 0 and col + k < grid[0].length
      if grid[row - 1][col + k] == '*'
        neighbors += 1
      end
    end

    # Contador de vecinos cells de la row de en medio
    if row >= 0 and col + k >= 0 and col + k < grid[0].length
      if col + k != col
        if grid[row][col + k] == '*'
          neighbors += 1
        end
      end
    end

    # Contador de vecinos cells de la row de abajo
    if row + 1 < grid.length and col + k >= 0 and col + k < grid[0].length
      if grid[row + 1][col + k] == '*'
        neighbors += 1
      end
    end
  end
  return neighbors
end

def main ()
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

  for i in 0..grid.length - 1
    for j in 0..grid[i].length - 1
      neighbors = count_neighbors(grid, i, j) 
      grid_aux[i][j] = game_rules(neighbors, grid[i][j])
    end
  end
  
  puts ' New generation'
  puts ''
  puts grid_aux
end

main()