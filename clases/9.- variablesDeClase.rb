#https://www.youtube.com/watch?v=ArnePVp68F0

class Video
  @type = "video/mp4/"#variable de instancia
  @@type = "video/mp4" #variable de clase

  def self.type_desde_clase
    p @@type
  end

  def type_desde_objeto
    p @@type
  end

end

# Video.type_desde_clase
# Video.new.type_desde_objeto


class Videoo
  @@de_clase = "Clase woo"
  @de_instancia ="Instancia yeii"
  def self.test
    p @@de_clase
    p @de_instancia
  end
end

class YouTube < Videoo
  def self.test
    p @@de_clase
    p @de_instancia #no accede a las variables de instancia de la clase padre
  end
end

Videoo.test
YouTube.test
