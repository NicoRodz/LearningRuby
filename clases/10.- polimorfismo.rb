#multiples eventos hacen reaccionar distinto a distintos elementos, esto es polimorfismo

class Video
  def play
    #not implemented
  end
end

class Vimeo < Video
  def play
    p "Inserta el reproductor de vimeo"
  end
end

class YouTube < Video
  def play
    p "Inserta el reproductor de Youtube"
  end
end

videos = [YouTube.new, Vimeo.new, Vimeo.new, YouTube.new, YouTube.new]

videos.each do |video|
  video.play
end

#aqui no es necesario usar herencia. estilo duck typing
