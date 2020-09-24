class SoyObjetoLoJuro
  @nombre_clase="Soy Objeto Lo Juro" 
  #esto es una variable de instancia, le pertenece a un Objeto
  #no se puede acceder a esta variable desde fuera de la variable
  #si la asignacion se hace dentro del constructor, la funcion no le pertenece a la class
  # çsi no mas bien al metodo, si esta fuera del constructor le pertenece a la clase

  end
  def self.nombre_clase
    @nombre_clase
  end

  def self.nombre_clase=(nombre_clase) #el self hace que el metodo le pertenezcala la clase
    @nombre_clase = nombre_clase
  end

  #ALTERNATIVA AL self
  class << self
    def nombre_clase #ya no se pone self antes del nombre de la funcion
      @nombre_clase
    end
  end

end

SoyObjetoLoJuro.nombre_clase = "Otra cosa"

puts SoyObjetoLoJuro.nombre_clase


class User
end

User.new().find() #Esto estaria mal
User.find() # es para buscar un usuario en la db, ahi es cuando se usan funciones self
