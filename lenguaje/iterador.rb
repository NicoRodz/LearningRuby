(1..10).each do |numero|
  puts numero
end

(0..20).step(2).each do |numero| #step para ir de dos en dos
  puts numero
end

('a'..'z').each do |numero| #step para ir de dos en dos
  puts numero + ","
end


puts (0..10).min
puts (0..10).max
puts (0..10).to_a.reverse #convierte el rango a un arreglo

puts ('ma'..'md').to_a
