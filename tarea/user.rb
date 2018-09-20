require "time"
require "fileutils"
# puts Time.new(2002, 10, 30)

class User
  attr_accessor :name
  attr_accessor :index

  def initialize()
    @name
    @index
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
      if index.to_i == user_index.to_i then @name = line end
    end
    @index = user_index
    f.close
  end
end


class Portfolio < User

  def see_portfolio(first_date: "", last_date: "")
    if first_date == "" then first_date = "2018-01-01" end
    if last_date == "" then last_date = "2018-12-30" end
    if check_portfolio_exist() then show_portfolio() else puts "Profit don`t exist" end
  end

  def check_portfolio_exist()
    unless File.exist?("data/#{self.name}.txt") #si existe
      return false
    end
    return true
  end

  def show_portfolio()
    puts "lets show profit"
  end

  def create_new_portfolio()
    unless File.exist?("data/#{self.name}.txt") #si existe
      FileUtils.touch("./data/#{self.name}.txt")
      set_fake_data()
      puts "Portfolio for #{self.name} created with fake 'random' data."
      return true
    end
    puts "Portfolio Exist... you can see the data in option 1"
    return false
  end

  def set_fake_data
    @portfolio = {}
    (0..12).each do |month|
      (0..30).each do |day|
        date = "2018-#{month}-#{day}"
        cost = rand(100)
        contrib = rand(100)
        @portfolio[date] = {
          cost: cost,
          price: cost + rand(10),
          margen_gain: contrib - cost, #pasar a porcentaje
          contrib: contrib
        }
      end
    end
    f = File.new("data/#{self.name}.txt", 'w')
    f.write(@portfolio)
    f.close
  end
end
