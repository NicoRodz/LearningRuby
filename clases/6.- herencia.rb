# #herencia es crear clases a partir de otras clases
# #clases hijas estan basadas en clases padres
#
# class Video
#   attr_accessor :title, :duration
# end
#
# #herencia es una especializacion del padre. #no copiar codigo.
# class YouTubeVideo < Video #hereda todo propiedades y metodos de la clase padre
#   attr_accessor :youtube_id
# end
#
# yt = YouTubeVideo.new
# yt.title = "herencia en ruby"
# yt.youtube_id = "asdasudh8323"
#
# puts yt.title
# puts yt.youtube_id

class Object
  def i_have_super_powers
    puts "este metodo esta en todos los objetos"
  end
end

class Video #esta hereda por defecto de OBJECT
  attr_accessor :title
  attr_accessor :duration
  attr_accessor :description
  def embebed_video_code
    "<video></video>"
  end
  def setup(title)
    @title = title
  end
end

class FacebookVideo < Video
  attr_accessor :facebook_id
end

class YouTubeVideo < Video
  attr_accessor :youtube_id
  def embebed_video_code
      "sobreescribe"
  end
  def setupe(title)
    super#escribe a continuacion de la funcion anterior.
    # super()#con parentesis, no entrega todos los argumentos
    #youtubeApi.init()
    puts "algo extra"
  end
end

puts YouTubeVideo.new().embebed_video_code
puts YouTubeVideo.new().i_have_super_powers
1.i_have_super_powers
[].i_have_super_powers
