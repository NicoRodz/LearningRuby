def square(x)
  # x * x #retorna lo que encuentra en la ultima liena #se usa return cuando
  # el programa quiere terminar de ejecutarse antes
  # return x * x
  return 0 unless x.is_a? Integer #retornar true solo si x es entero
  x * x
end

# square(1) #se recomienda ocupar parentesis
puts square 2 #los parentesis se pueden ignorar
