class Tutor
  def initialize(name)
    @nombre = name #variable de instancia.
    #no puede ser moificada o observada desde fuera de la clase
    #puedes acceder desde donde quieras de la clase
    puts @nombre #esta si se imprime
  end
  def nombre #asi se escriben los geteres
    @nombre
  end
  def nombre=(nombre) #asi se escriben los seters
    @nombre = nombre
  end

end

nicolas = Tutor.new("Nicolas")
jake = Tutor.new("Jake")

# puts nicolas.nombre
# puts jake.nombre

puts nicolas.nombre
puts jake.nombre

nicolas.nombre=("Nico") #el espacio se puede poner junto o separado
jake.nombre=("jakeMate")

puts nicolas.nombre
puts jake.nombre



#CLASE MEJORADA

class TutorMejorado
  attr_accessor :nombre
  attr_reader :nombre
  attr_writer :nombre
  def initialize(name)
    @nombre = name
  end
end

jake = TutorMejorado.new("Jake")
jake.nombre = 'JakeMate'
puts jake.nombre
