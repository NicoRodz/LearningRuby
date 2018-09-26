load './controllers/logs.rb'
load './controllers/security.rb'
load './controllers/utils.rb'
load './controllers/portfolio.rb'

class User
  attr_accessor :username
  attr_accessor :portfolio

  def initialize()
    @logs = Logs.new
    @sec = Security.new()
    @utils = Utils.new
    @portfolio = Portfolio.new
    @username = ''
  end

  def create_user()
    registered_users = @utils.get_all_users()
    @logs.create_account_username()
    user_name = gets().chomp
    if registered_users.include?(user_name)
      @logs.user_exist()
      self.create_user()
      return false
    end
    if user_name == '' then self.create_user() end
    @logs.create_account_password()
    password = gets().chomp
    if password == '' then self.create_user() end
    password = @sec.md5_pass(password)
    @utils.save_new_user_with_password(user_name, password)
    @logs.user_created(user_name)
  end

  def log_in()
    @logs.insert_username()
    user_name = gets().chomp
    @logs.insert_password()
    password = gets().chomp
    password = @sec.md5_pass(password)
    if @utils.check_log_in(user_name, password)
      @username = user_name
      @portfolio.load_portfolio(user_name)
      return true
    else
      @logs.wrong_user_or_pass()
      return false
    end
  end

  def add_new_stock_to_portfolio(stock_name)
    @logs.get_invest_value()
    invest = gets().chomp.to_i
    @logs.will_invest_in_stock_with_value(stock_name, invest)
    option = gets().chomp.to_i
    case option
    when 1
      @portfolio.add_new_stock_for_user(stock_name, invest, @username)
      @logs.stock_added()
    else
      @logs.see_other_stock()
    end
  end

  def remove_stock_from_portfolio(stock_name)
    @logs.delete_alert(stock_name)
    option = gets().chomp.to_i
    case option
      when 0
        puts 'ok'
      when 1
        @portfolio.remove_stock_for_user(stock_name, @username)
        @logs.stock_deleted()
      else
        @logs.wrong_selection()
        self.remove_stock_from_portfolio(stock_name)
    end
  end

  def show_user_stocks()
    portfolio_temp = @utils.get_user_portfolio(@username)
    @logs.show_user_stocks_simple(portfolio_temp.keys)
    puts ' Press enter to continue...'
    gets()
  end

  def portfolio_between_dates()
    @logs.request_two_dates_for_portfolio()
    first_date = gets().chomp.to_s
    @logs.request_second_date()
    last_date = gets().chomp.to_s
    if first_date == '' || first_date.count('-') != 2 then first_date = '2018-01-01' end
    if last_date == '' || last_date.count('-') != 2then last_date = '2018-12-31' end
    @portfolio.profit(first_date, last_date, @username)
  end

end
