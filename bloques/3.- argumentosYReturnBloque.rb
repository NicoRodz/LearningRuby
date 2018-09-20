class Usuario
  attr_accessor :nombre
  def saludar
      saludo = yield(@nombre)
      puts saludo
  end
end

nico = Usuario.new
nico.nombre = "nico"
nico.saludar { |nombre| puts "hola #{nombre}"} #entre las barras el argumento a recibir
nico.saludar { |nombre| puts "hello #{nombre}"} #entre las barras el argumento a recibir
