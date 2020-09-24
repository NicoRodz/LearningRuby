tutor = { "nombre" => "uriel",
          "edad" => 20,
          20 => "veinte",
          [] => "arreglo"}

tutor["cursos"]=20

puts tutor
tutor.default = ":)" #para cuando no hay datos
puts tutor[45]


persona = { :nombre => "Nicolas",
            :edad => "23",
            :cursos => 10
        }
persona_correct = { nombre: "Nicolas", #es mejor escribirlo asi
            edad: "23",
            cursos: 10
        }

puts persona
puts persona_correct
puts persona_correct[:nombre] #Se busca por simbolo, no por strin

persona.each do |clave, valor|
  puts "en la #{clave} esta guardado #{valor}"
  puts persona[clave]
end

puts "------------------------------"

test = {nombre: "nicolas", edad: 24, curso: "ruby"}

puts test.length
puts test.has_key?(:nombre)
puts test.has_value?(24)
puts test.keys #devuelve las llaves
puts test.values #devuelve los valores
#test.clear #limpia cualquier elemento que hay dentro del hash
puts test.delete(:curso) #elimina ese elemento
puts test.empty? #devuelve true o false si esta vacio o no
puts test.key("nicolas")
puts test.invert #da vuelta key por value y value por keys

# para combinar dos hashes
user_info = {apellido: "rodriguez", segundo_apellido: "Niñoles"}
puts test.merge(user_info)
