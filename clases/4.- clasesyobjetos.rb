class Video #clases comienzan en mayuscula y separadas por camelcase calss PortfolioNico
  attr_accessor :minutes, :title

  def initialize(title) #inicia el objeto, no dejarle mucho trabajo.
    self.title = title
  end

  def play
  end

  def pause
  end

  def stop
  end

end

video_nico = Video.new("Objetos y clases")
# video_nico.title = "objetos y clases"
videos_jake = Video.new("Comidas Ricas")
# videos_jake.title = "comidas ricas"
puts video_nico.title
puts videos_jake.title
