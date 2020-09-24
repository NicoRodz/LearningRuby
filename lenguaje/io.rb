print "Dame tu nombre: "
nombre = gets
print "hola " + nombre
nombre = nombre.chomp #quita el ultimo caracter
print "tu nombre, #{nombre}, tiene #{nombre.length} letras"
