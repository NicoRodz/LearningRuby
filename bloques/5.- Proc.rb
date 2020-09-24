#un bloque no es un objeto !

# bloque = {puts "NOoooope"} #un bloque solo puede ser definido cuando se envia a un metodo


def hola &block #este block, no es un objeto, es un proc
  puts block.class.name
  block.call
end
hola {puts "Yeyy"}

def hola2 proc1, proc2
  proc1.call
  proc2.call
end

proc1 = Proc.new {puts "Hola p1"}
proc2 = Proc.new {puts "Hola p2"}
hola2(proc1, proc2)


#bloque se usan por defecto, proc es cuando necesites enviar a otro objeto, almacenar en una variable etc.

#los bloques son mas rapidos que los procs.
