playlist = ["First Song", "Second Song", "Third Song"]
playing = true
index_song = 0

while (index_song < playlist.length) && playing
  puts "reproduciendo #{playlist[index_song]}"
  index_song += 1
  puts "Coloca 0 para detener la reproduccion: "
  respuesta = gets().chomp.to_i
  playing = respuesta != 0
end

numero_magico = 20
puts "Adivina el numero magico: "
numero_usuario = gets().chomp.to_i

while numero_usuario != numero_magico
  puts "Incorrecto, adivina denuevo: "
  numero_usuario = gets().chomp.to_i
end

puts "Felicidades, adivinaste"
