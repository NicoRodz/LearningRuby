load './controllers/utils.rb'

class Portfolio

  attr_accessor :portfolio

  def initialize()
    @utils = Utils.new
    @portfolio
  end

  def profit(first_date, last_date)
  end

  def annualized_return()
  end

  def load_portfolio(username)
    @portfolio = @utils.get_user_portfolio(username)
    puts "portfolio: #{@portfolio}"
    sleep(2)
  end

  def add_new_stock(stock, invest, username)
    @utils.save_new_stock_for_user(stock, invest, username)
  end

  def remove_stock(stock, username)

  end


end
