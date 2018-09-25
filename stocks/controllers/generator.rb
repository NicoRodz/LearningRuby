require 'fileutils'
require 'json'
load './controllers/utils.rb'

class Generator

  def generate_user_file()
    Dir.mkdir('user')
    FileUtils.touch('./user/users.txt')
  end

  def generate_stocks_folder()
    Dir.mkdir('stocks')
    stocks_generator = StocksGenerator.new
    self.handle_stock_generation(stocks_generator)
  end

  def handle_stock_generation(stocks_generator)
    stocks_generator.generate_google()
    stocks_generator.generate_amazon()
    stocks_generator.generate_jp_morgan()
    stocks_generator.generate_Berkshire_Hathaway()
  end

end


class StocksGenerator

  def initialize()
    @Utils = Utils.new
  end

  def create_data(stock_value, name)
    historic_data = {}
    (1..12).each do |month|
      (1..30).each do |day|
        date = @Utils.correct_date(month, day)
        historic_data[date] =  stock_value.floor
        stock_value = @Utils.profit_stock(stock_value)
      end
    end
    @Utils.write_stock_data(historic_data: historic_data, filename: name)
  end

  def generate_google()
    name = 'NASDAQ: GOOGL'
    self.create_data(1073, name)
  end

  def generate_amazon()
    name = 'NASDAQ: AMZN'
    self.create_data(1189, name)
  end

  def generate_jp_morgan()
    name = 'NYSE: JPM'
    self.create_data(107, name)
  end

  def generate_Berkshire_Hathaway()
    name = 'NYSE: BRKA'
    self.create_data(295755, name)
  end

end
