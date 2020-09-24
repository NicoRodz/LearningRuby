def hola
  yield
end
nombre = "Nico"
hola {puts "Hola #{nombre}"}

hola do
  nombre = "Marco"
  puts "Hola #{nombre}"
end
puts nombre


puts "-----"

# def chao
#   yield("Nico")
# end
# chao do |name|
#   puts "Hola #{name}"
# end
# puts name

puts "-------"

def hola1
  yield
end

nombre = "nico"
hola do |; nombre| #variable local del bloque -> ; separa arhumentos |var1, var2 ; var1, varLoc2\
  nombre = "Marcos"
  puts "Hola #{nombre}"
end

puts nombre
