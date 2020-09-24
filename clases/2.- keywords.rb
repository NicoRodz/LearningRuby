def hola(nombre:"", edad:0 , **options) #vlores iniciales
# def hola(**options) #PAre recibir numero ilimitado de keywors
# def hola( nombre: , edad:0 , **options) #nombre es obligatorio
  if edad > 30
    puts "Hola señor #{nombre}"
  elsif edad < 30
    puts "Hola jovemn #{nombre}"
  end
  # puts options[:animal_favorito]
end

hola(nombre: "Nicolas", edad: 20)
hola(edad: 24, nombre: "jake")
