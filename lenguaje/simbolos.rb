#es una cadena inmutable, no se puede modificar en tiempo de ejecucion

#esto si se puede
cadena = "nicolas"
cadena.capitalize!

cadena2 ="nicolas"
simbolo = :Nicolas
simbolo2 = :Nicolas

puts cadena.object_id
puts cadena2.object_id

#los simbolos comparten object id, recicla simbolos
puts simbolo.object_id
puts simbolo2.object_id

#cuando utilizar simbolos
# 1.- cuando no necesito modificar el strings
# 2.- cuando no necesito los metodos del string
# 3.- los simbolos suelen ser muy utiles como nombres de cosas
