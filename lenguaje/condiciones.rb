numero_uno = gets.chomp.to_i  #chomp quita el ultimo caracter
numero_dos = gets.chomp.to_i

if numero_uno > numero_dos
  puts"#{numero_uno} mayor que #{numero_dos}"
end

unless numero_uno >= 18 #es igual que el if pero a la inversa, para cuando tienes olo una condicion
    print "menor de edad, no puedes pasar"
end
