# Public
# Privated
# Protected


#en herencia, los hijos peueden llamar todo tipo de metodo y variable
 #######
  # SCOPE
 #######

class Humano
  def initialize
    privado
  end
  def publico
    puts "soy publico"
  end
  private
    def privado
      puts "soy privado"
    end
  protected
    def protegido
      puts "soy protegido"
    end
end

class Tutor < Humano
  def initialize
    @inner = Humano.new
    self.publico
    protegido #clase hija si puede llamar al metodo
  end
  def llamar_protegido
    @inner.protegido #metodo heredado por HUmano
  end
end

class Alien
  def initialize
    @inner = Humano.new
  end
  def llamar_protegido
    @inner.protegido
  end
end

# Humano.new
# Tutor.new
Alien.new.llamar_protegido
Tutor.new.llamar_protegido
