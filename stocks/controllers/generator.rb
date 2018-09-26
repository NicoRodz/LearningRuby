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
    @utils = Utils.new
  end

  def create_data(stock_value, name)
    historic_data = {}
    (1..12).each do |month|
      (1..30).each do |day|
        date = @utils.correct_date(month, day)
        historic_data[date] =  stock_value.floor
        stock_value = @utils.profit_stock(stock_value)
      end
    end
    @utils.write_stock_data(historic_data: historic_data, filename: name)
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


class PortfolioGenerator

  def initialize()
    @utils = Utils.new
  end

  def historic_data_for_user(user_portfolio, first_date, last_date)
    stocks_historic_data = {}
    final_data = []
    first_value_year = 0
    f_year, f_month, f_day = first_date.split('-').map(&:to_i)
    l_year, l_month, l_day = last_date.split('-').map(&:to_i)
    user_portfolio.each_with_index do |stock, index|
      stock_name = stock[0]
      invest_value = stock[1]
      stocks_historic_data = {}
      @utils.get_stock_data(stock_name).each do |date, value|
        if date == '2018-01-01'
          first_value_year = value
          stocks_historic_data[stock_name] = []
        end
        value_year, value_month, value_day = date.split('-').map(&:to_i)
        if value_year >= f_year && value_year <= l_year
          if value_month >= f_month && value_month <= l_month
            if value_month == f_month
              if value_month == l_month #es el mismo mes
                if value_day >= f_day && value_day <= l_day
                  stocks_historic_data[stock_name].push(value)
                end
              elsif value_day >= f_day
                stocks_historic_data[stock_name].push(value)
              end
            elsif value_month == l_month
              if value_day <= l_day
                stocks_historic_data[stock_name].push(value)
              end
            else
              stocks_historic_data[stock_name].push(value)
            end
          end
        end
      end
      stocks_historic_data[stock_name + '-firstValue'] = first_value_year
      final_data.push(stocks_historic_data)
    end
    return final_data
  end
end
