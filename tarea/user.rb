require "time"
require "fileutils"
require "monetize"
require 'json'
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
      if index.to_i == user_index.to_i
         @name = line
         @index = user_index
       end
    end
    f.close
  end

  def check_user_file()
    f = File.new("data/users.txt", 'r')
    if f.read == ""
      f.close
       return false
    else
      f.close
      return true
    end

  end
end


class Portfolio < User

  def see_portfolio(first_date: "", last_date: "")
    if first_date == "" then first_date = "2018-01-01" end
    if last_date == "" then last_date = "2018-12-30" end
      #deprecated
      # if check_portfolio_exist() then show_portfolio() else puts "Profit don`t exist" end
    f = File.new("data/#{self.name}.txt", 'r')
    data = JSON.parse(f.read)
    first_month = first_date.split("-")[1]
    last_month = last_date.split("-")[1]
    first_value = 0
    last_value = 0
    system "clear"
    puts "-.Portfolio for #{first_date} to #{last_date}.-"
    puts ""
    data.each do |path, investment|
      month_to_see = path.split("-")[1]
      if month_to_see.to_i == first_month.to_i then first_value = investment end
      if month_to_see.to_i == last_month.to_i then last_value = investment end
      if month_to_see.to_i >= first_month.to_i && month_to_see.to_i <= last_month.to_i
        puts "In month #{month_to_see} have #{investment} capital"
      end
    end
    puts ""
    puts "You won in this period $#{last_value - first_value}"
    puts "In percentaje of grow: #{((last_value * 100) / first_value) - 100}%"
    puts ""
  end

  def check_portfolio_exist()
    unless File.exist?("data/#{self.name}.txt") #si existe
      return false
    end
    return true
  end

  def create_new_portfolio()
    unless File.exist?("data/#{self.name}.txt") #si existe
      FileUtils.touch("./data/#{self.name}.txt")
      puts "Portfolio for #{self.name} created with fake 'random' data."
      set_fake_data()
      sleep(2)
      return true
    end
    puts "Portfolio Exist... you can see the data in option 1"
    return false
  end

  def set_fake_data
    @portfolio = {}
    investment = rand(100000..10000000)
    stock_strategy = ["very conservative", "conservative", "moderate", "risky", "very risky"]
    strategy = stock_strategy[rand(stock_strategy.length)]
    puts "You Invest #{investment} with #{strategy} strategy...!"
    case strategy
    when "very conservative"
      rentability = 0.023
    when "conservative"
      rentability = 0.030
    when "moderate"
      rentability = 0.038
    when "risky"
      rentability = 0.042
    when "very risky"
      rentability = 0.051
    else
      rentability = 0
    end
    (1..12).each do |month|
      if month < 10
        date = "2018-0#{month}"
      else
        date = "2018-#{month}"
      end
        @portfolio[date] =  investment.floor
        investment = investment + (investment * rentability)
    end
    f = File.new("data/#{self.name}.txt", 'w')
    f.write(JSON.generate(@portfolio))
    f.close
  end
end
