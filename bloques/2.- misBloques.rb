
def hola
  # yield #para llamar el bloque que se le entrega
  #si llamo hola sin entregar un bloque de codigo da eror, se soluciona asi:
  yield if block_given?
end

hola {puts "Hola Nico"}

hola do
  puts "Hola so"
end

hola()


def chao &bloque#el argumento que recibe el bloque tiene que estar al final de la lista de argumentos
  # bloque.call if block_given?
  otro_chao(&bloque)
end

def otro_chao &block
  block.call
end

chao {puts "hola Mundo"}
