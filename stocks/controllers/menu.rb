
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
    when 1
      self.show_stocks(true)
    when 2
      self.show_stocks(false)
    when 3
      if @user.log_in() then self.handle_user_menu() end
    when 4
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
        if with_date then @stocks[0].price(date: @logs.request_one_date()) else @stocks[0].present() end
      when 2
        if with_date then @stocks[1].price(date: @logs.request_one_date()) else @stocks[1].present() end
      when 3
        if with_date then @stocks[2].price(date: @logs.request_one_date()) else @stocks[2].present() end
      when 4
        if with_date then @stocks[3].price(date: @logs.request_one_date()) else @stocks[3].present() end
      else
        @logs.wrong_selection()
    end
    self.show_stocks(with_date)
  end

  def handle_user_menu()
    @logs.user_menu(@user.username)
    option = gets().chomp.to_i
    case option
      when 0
        @username = ''
        self.start_app()
      when 1
        self.manage_portfolio_menu()
      when 2
        puts 'falta este menu tambien por hader'
        sleep(2)
      else
        @logs.wrong_selection()
    end
    self.handle_user_menu()
  end

  def manage_portfolio_menu()
    @logs.manage_portfolio_menu_log(@user.username)
    option = gets().chomp.to_i
    case option
      when 0
        self.handle_user_menu()
      when 1
        self.add_stock_to_portfolio_menu()
      when 2
        self.remove_stock_from_portfolio_menu()
      else
        @logs.wrong_selection()
        self.manage_portfolio_menu()
    end
  end

  def add_stock_to_portfolio_menu()
    @logs.show_stock_list(false)
    #obtener del usuario los stocks que ya tiene
    option = gets().chomp.to_i
      case option
        when 0
          self.manage_portfolio_menu()
        when 1
          @user.add_new_stock_to_portfolio(@stocks[0].STOCK_NAME)
        when 2
          @user.add_new_stock_to_portfolio(@stocks[1].STOCK_NAME)
        when 3
          @user.add_new_stock_to_portfolio(@stocks[2].STOCK_NAME)
        when 4
          @user.add_new_stock_to_portfolio(@stocks[3].STOCK_NAME)
        else
          @logs.wrong_selection()
          self.add_stock_to_portfolio_menu()
      end
  end

  def remove_stock_from_portfolio_menu()
    @logs.show_stock_list(false)
    #obtener del usuario los stocks que ya tiene
    option = gets().chomp.to_i
      case option
        when 0
          self.manage_portfolio_menu()
        when 1
          @user.remove_stock_from_portfolio(@stocks[0].STOCK_NAME)
        when 2
          @user.remove_stock_from_portfolio(@stocks[1].STOCK_NAME)
        when 3
          @user.remove_stock_from_portfolio(@stocks[2].STOCK_NAME)
        when 4
          @user.remove_stock_from_portfolio(@stocks[3].STOCK_NAME)
        else
          @logs.wrong_selection()
          self.remove_stock_from_portfolio_menu()
      end
  end

end
