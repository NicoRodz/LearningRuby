def hola_gente(personas)
  personas.each {
    |persona| puts "Hola #{persona}"
    }
end
hola_gente(["Uriel", "Nicolas"])

def hola_gente_metodo(*personas)
  personas.each {|persona| puts "Hola #{persona}"}
end
hola_gente_metodo( 23, 21)


def hola_gente_metodo2(mensaje, *personas)
  personas.each {|persona| puts "#{mensaje} #{persona}"}
end
hola_gente_metodo2("hey Hola", "Nicolas", "Caro", "Jake")
saludos = [ "Nicolas", "Caro", "Jake" ]
hola_gente_metodo2("hey HoLA", saludos) #hey HoLA ["Nicolas", "Caro", "Jake"]
hola_gente_metodo2("hey HoLA", *saludos) #muestra el saludo correcto
