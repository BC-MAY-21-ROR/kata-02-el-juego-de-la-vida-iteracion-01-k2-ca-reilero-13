# input = gets.chomp.split(' ')
# rows = input[0].to_i
# cols = input[1].to_i

# grid = []
# rows.times do
#   grid.append(gets)
# end
 
grid = [
  '.*......',
  '*****...',
  '..***...',
  '..***...' 
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
        vecinos += 1
        # print(fila - 1, ' ', columna + k)
        # puts ' '
      end
    end

    # Contador de vecinos celdas de la fila de en medio
    if fila >= 0 and columna + k >= 0 and columna + k < grid[0].length
      if columna + k != columna
        if grid[fila][columna + k] == '*'
          vecinos += 1
          # print(fila, ' ', columna + k)
          # puts ' '
        end
      end
    end
    
    
    # Contador de vecinos celdas de la fila de abajo
    if fila + 1 < grid.length and columna + k >= 0 and columna + k < grid[0].length
      if grid[fila + 1][columna + k] == '*'
        vecinos += 1
        # print(fila + 1, ' ', columna + k)
        # puts ''
      end
    end
  end
  return vecinos
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
puts "checando 2, 3"
contar_vecinos(grid, 2, 3)
puts "checando 1, 3"
contar_vecinos(grid, 1, 3)
puts "checando 1, 5"
contar_vecinos(grid, 1, 5)

# Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any dead cell with exactly three live neighbours becomes a live cell.

def reglas_del_juego(numero_de_vecinos, celda)

  resultado = ' '


  if celda == '*'
    if numero_de_vecinos < 2
      resultado = '.'
    elsif numero_de_vecinos > 3
      resultado = "."
    else 
      resultado = '*'  
    end 
  end
  if celda == '.' and numero_de_vecinos == 3
    resultado = '*'   
  end
  return resultado
end


def main ()
  grid = [
  '.*......',
  '*****...',
  '..***...',
  '..***...' 
]
grid_temporal = [
  '.*......',
  '*****...',
  '..***...',
  '..***...' 
]


  for i in 0..grid.length - 1
    for j in 0..grid[i].length - 1
      vecinos = contar_vecinos(grid, i, j) 
      grid_temporal[i][j] = reglas_del_juego(vecinos, grid[i][j])
      #puts grid[i][j]
    end
  end
  puts grid_temporal
end

main()


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
