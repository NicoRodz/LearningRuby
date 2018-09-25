
load './controllers/logs.rb'
load './controllers/user.rb'
load './controllers/stock.rb'

class Menu
  def initialize()
    @logs = Logs.new
    @user = User.new
    @stocks = [ Stock.new('NASDAQ: GOOGL'),
                Stock.new('NASDAQ: AMZN'),
                Stock.new('NYSE: JPM'),
                Stock.new('NYSE: BRKA')]
  end

  def start_app()
    @logs.welcome()
    selection = gets().chomp.to_i
    case selection
    when 0
      self.show_stocks(true)
    when 1
      self.show_stocks(false)
    when 2
      @user.log_in()
    when 3
      @user.create_user()
    else
      @logs.wrong_selection()
    end
    self.start_app()
  end

  def show_stocks(with_date)
    @logs.show_stock_list(with_date)
    option = gets().chomp.to_i
    case option
      when 0
        self.start_app()
      when 1
        if with_date
          @stocks[0].price(date: @logs.request_one_date())
        else
          @stocks[0].present()
        end
      when 2
        if with_date
          @stocks[1].price(date: @logs.request_one_date())
        else
          @stocks[1].present()
        end
      when 3
        if with_date
          @stocks[2].price(date: @logs.request_one_date())
        else
          @stocks[2].present()
        end
      when 4
        if with_date
          @stocks[3].price(date: @logs.request_one_date())
        else
          @stocks[3].present()
        end
      else
        @logs.wrong_selection()
    end
    self.show_stocks(with_date)
  end

end
