# input = gets.chomp.split(' ')
# rows = input[0].to_i
# cols = input[1].to_i

# grid = []
# rows.times do
#   grid.append(gets)
# end
 
grid = [
  '.*......',
  '**..*...',
  '...**...',
  '........' 
]

# puts grid[0]
# puts grid[0][0]
# puts grid[0][1]

def contar_vecinos(grid, fila, columna)
  vecinos = 0
  for k in -1..1 
    # Contador de vecinos celdas de la fila arriba 
    if fila - 1 >= 0 and columna + k >= 0 and columna + k < grid[0].length
      if grid[fila - 1][columna + k] == '*'
    end

    # Contador de vecinos celdas de la fila de en medio
    if fila >= 0 and columna + k >= 0 and columna + k < grid[0].length
      if grid[fila - 1][columna + k] == '*'
      print(fila - 1, ' ', columna + k)
      puts ''
    end
    
    # Contador de vecinos celdas de la fila de abajo
    if fila + 1 >= 0 and columna + k >= 0 and columna + k < grid[0].length
      if grid[fila - 1][columna + k] == '*'
      print(fila - 1, ' ', columna + k)
      puts ''
    end
  end
end

# .*......
# **..*...
# ...**...
# ........

# for i in 0..grid.length - 1
#   for j in 0..grid[i].length - 1
#     puts grid[i][j]
#   end
# end

# contar_vecinos(grid, 1, 0)
# contar_vecinos(grid, 1, 1)
# puts "checando 1, 6"
# contar_vecinos(grid, 1, 6)
# puts "checando 1, 7"
# contar_vecinos(grid, 1, 7)

# Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any dead cell with exactly three live neighbours becomes a live cell.

# Generacion 1
# .*......
# **..*...
# ...**...
# ........

# Generacion 2
# **......
# **.**...
# ...**...
# ........

# Generacion 3
# ***.....
# **.**...
# ..***...
# ........
