#bloque es sentencias agrupadas


[1,2,3,4,5,6,7].each do |number|
  puts number
end

[1,2,3,4,5,6,7].each {|number| puts number}

#si el bloque es de una linea de codigo, usa {}
#si usa mas de una linea usas do end

impares = [1,2,3,4,5,6,7].select do |number|
  number % 2 != 0 #se queda con los elementos true
end
puts impares

["Nico", "Caro", "Jake"].each_with_index do |nombre, index|
  puts "#{index}.- #{nombre}"
end
