require "time"

class User
  @@name
end


class Portfolio < User
  attr_accessor :stocks

  def initialize()
    @portfolio
    @portfolio = self.get_data
    # puts @portfolio
  end

  def profit(date1, date2) #ganancia
    puts "profit completo"
  end

  def get_data
    @portfolio = {}
    (0..12).each do |month|
      (0..30).each do |day|
        date = "2018-#{month}-#{day}"
        cost = rand(100)
        contrib = rand(100)
        @portfolio[date] = {
          cost: cost,
          margen_gain: contrib - cost, #pasar a porcentaje
          contrib: contrib
        }
      end
    end
    puts @portfolio
  end

end



# puts Time.new(2002, 10, 30)
