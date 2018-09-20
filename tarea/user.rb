require "time"

class User
  attr_accessor :name
  attr_accessor :index

  def initialize()
    self.name
    self.index
  end

  def create_new_user(name)
    f = File.new("data/users.txt", 'a')
    f.write(name + "\n")
    f.close
  end

  def see_all_users()
    f = File.new("data/users.txt", 'r')
    system "clear"
    puts "---- Users ---"
    f.readlines.each_with_index do |line, index|
      puts "#{index}: #{line}"
    end
    puts "--------------"
    f.close
  end

  def get_user_name(user_index)
    f = File.new("data/users.txt", 'r')
    f.readlines.each_with_index do |line, index|
      if index.to_i == user_index.to_i then self.name = line end
    end
    self.index = user_index
    f.close
  end

  def handle_user(num_user)

  end
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
