load './controllers/utils.rb'
load './controllers/generator.rb'

class Portfolio

  def initialize()
    @utils = Utils.new
    @p_generator = PortfolioGenerator.new
    @portfolio
  end

  def profit(first_date, last_date, username)
    user_portfolio = @utils.get_user_portfolio(username)
    filtered_portfolio = @p_generator.historic_data_for_user(user_portfolio, first_date, last_date)

    puts "INFO #{filtered_portfolio}"
    sleep(10)
  end

  def annualized(months, first_value, second_value)
    r = ((second_value.to_f - first_value.to_f) / first_value.to_f ).round(3)
    ra = ((1+r)**(1/(months.to_f/12))-1)
    puts "Annualized return:        #{(ra*100).round(2)}%"
  end

  def load_portfolio(username)
    @portfolio = @utils.get_user_portfolio(username)
  end

  def add_new_stock_for_user(stock, invest, username)
    @utils.save_new_stock_for_user(stock, invest, username)
  end

  def remove_stock_for_user(stock, username)
    @portfolio = @utils.get_user_portfolio(username)
    @portfolio.delete(stock)
    @utils.update_user_stock_file(@portfolio, username)
  end


end
