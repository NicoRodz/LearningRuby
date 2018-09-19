#Arreglos internos denen tener la misma cantidad de elementos
#matrix => todos los elementos deben ser Numeros
require 'matrix'
matriz = Matrix[[1,3,4],[2,4,5],[3,4,5]]
# se recorre de izquiera a deecha arriba abajo
matriz.each(:diagonal) do |i|
  puts i
end

matriz.each do |i|
  puts i
end

matriz.each(:strict_lower) do |i| #elementos bajo la diagonal
  puts i
end

matriz.each(:strict_upper) do |i| #elementos sobre la diagonal
  puts i
end

puts matriz.diagonal? #imprime la diagonal
