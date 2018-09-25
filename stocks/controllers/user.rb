load './controllers/logs.rb'
load './controllers/security.rb'
load './controllers/utils.rb'
load './controllers/portfolio.rb'

class User
  attr_accessor :username

  def initialize()
    @logs = Logs.new
    @sec = Security.new
    @utils = Utils.new
    @portfolio = Portfolio.new
    @username
  end

  def create_user()
    registered_users = @utils.get_all_users()
    @logs.create_account_username()
    user_name = gets().chomp
    if registered_users.include?(user_name)
      @logs.user_exist()
      self.create_user()
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

  def add_new_stock_to_portfolio(name)
    @logs.get_invest_value()
    invest = gets().chomp.to_i
    @logs.will_invest_in_stock_with_value(name, invest)
    option = gets().chomp.to_i
    case option
    when 1
      @portfolio.add_new_stock(name, invest, @username)
    else
      @logs.see_other_stock()
    end
  end

  def remove_stock_from_portfolio(name)
    #get the info
    @portfolio.remove_stock()
  end

end
