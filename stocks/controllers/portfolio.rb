load './controllers/utils.rb'
load './controllers/generator.rb'
load './controllers/logs.rb'

class Portfolio

  def initialize()
    @utils = Utils.new
    @p_generator = PortfolioGenerator.new
    @logs = Logs.new
    @portfolio
  end

  def profit(first_date, last_date, username)
    @logs.header_profit_portfolio(first_date, last_date)
    user_portfolio = @utils.get_user_portfolio(username)
    filtered_portfolio = @p_generator.historic_data_for_user(user_portfolio, first_date, last_date)
    profit_portfolio = 0
    annualized_final_value = 0
    filtered_portfolio.each do |value|
      count = 0
      array_portfolio_values = 0
      initial_value_user = 0
      initial_value_stock = 0
      stock_name = ''
      value.keys.each do |element|
        if count == 0
          array_portfolio_values = value[element]
          initial_value_user = user_portfolio[element]
          stock_name = element
        elsif
          initial_value_stock = value[element]
        end
        count += 1
      end
      stock_profit = self.calculate_profit(initial_value_stock, initial_value_user, array_portfolio_values)
      profit_portfolio += stock_profit
      annualized_value = annualized_return(array_portfolio_values.length,
                        array_portfolio_values[0],
                        array_portfolio_values[array_portfolio_values.length]
                        )
      annualized_final_value += annualized_value
      @logs.stock_profit_portfolio(stock_name,
                                   stock_profit,
                                   initial_value_user,
                                   annualized_value
                                    )
      # puts "in_v_stock: #{initial_value_stock}"
      # puts "in__v_user: #{initial_value_user}"
      # puts "Array info: #{array_portfolio_values}"
      # puts '-------------------------------------'
    end
    @logs.final_total_profit_and_annualized(profit_portfolio, annualized_final_value)
    gets()
  end

  def annualized_return(days, first_value, second_value)
    r = ((second_value.to_f - first_value.to_f) / first_value.to_f ).round(3)
    ra = (((1+r)**(1/(days.to_f/360))-1)*100).round(2)
  end

  def calculate_profit(initial_value_stock, initial_value_user, array_portfolio_values)
    weight_percentage = initial_value_user * 100 / initial_value_stock
    array_length = array_portfolio_values.length
    initial_value = array_portfolio_values[0] * weight_percentage
    final_value = array_portfolio_values[array_length-1] * weight_percentage
    profit_portfolio =  initial_value - final_value
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
