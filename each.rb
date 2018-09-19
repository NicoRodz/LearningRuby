# calificaciones = %w[10 11 12 13 14]
calificaciones = [10, 11, 12, 13, 14]
suma = 0
calificaciones.each_with_index do |calificacion,index|
  puts "en #{index}, ahora la calificacion es #{calificacion}"
end

calificaciones.each do |calificacion|
  puts " ahora la calificacion es #{calificacion}"
end

calificaciones.each do |calificacion|
  suma += calificacion.to_i
end

puts "el promedio de las calificaciones es #{suma.to_f / calificaciones.length}"


# Operaciones con arreglos

puts calificaciones * "-" #separa los elementos con un guion y devuelve un string
puts calificaciones.join(",").class.name #devuelve que es u string / separados por una coma
puts calificaciones.sort
puts calificaciones.sort.reverse
puts calificaciones.reverse

puts calificaciones.include?(10) #saber si tiene este elemento

puts calificaciones.first #entrega el primero
puts calificaciones.last #entrega el ultimo

puts calificaciones.uniq #devuelve valores unicos

puts calificaciones.sample #devuelve un elemento aleatorio del arreglo
