class Logs

  def clean_console()
    system 'clear'
  end

  def show_bar()
    puts '#####################################'
  end

  def welcome()
    self.clean_console()
    self.show_bar()
    puts '  Welcome to Fintual Stocks Admin system'
    puts '     1: To see Stock in a specific date'
    puts '     2: To see Stocks'
    puts '     3: Log In'
    puts '     4: Create User'
    self.show_bar()
  end

  def user_menu(user_name)
    self.clean_console()
    self.show_bar()
    puts "  Welcome to Fintual Stocks menu #{user_name.capitalize}"
    puts '     0: To Exit'
    puts '     1: To manage a Portfolio'
    puts '     2: To see a Portfolio between two dates'
    puts '     3: To see your stock list'
    self.show_bar()
  end

  def show_stock_list(with_date)
    self.clean_console()
    self.show_bar()
    if with_date then puts '  Stocks List to see in one date' else puts '            Stocks List' end
    puts '          Select one...'
    puts ''
    puts '          0: To exit'
    puts '          1: NASDAQ: GOOGL'
    puts '          2: NASDAQ: AMZN'
    puts '          3: NYSE: JPM'
    puts '          4: NYSE: BRKA'
    self.show_bar()
  end

  def show_stock_simple_data(montly_data, stock_name)
    self.clean_console()
    self.show_bar()
    puts "Data for Stock: #{stock_name}"
    puts '                              '
    puts '  Date      AVG Month value '
    montly_data.each do |date, value|
      puts "  #{date}     US$ #{value} "
    end
    puts ''
    puts 'Press enter to continue...'
  end

  def manage_portfolio_menu_log(user_name)
    self.clean_console()
    self.show_bar()
    puts "        Manage Portfolio #{user_name.capitalize}"
    puts '     0: To exit'
    puts '     1: to Add stock to Portfolio'
    puts '     2: to remove stock from Portfolio'
    self.show_bar()
  end

  def show_price_in_one_date(date, value, stock_name)
    self.clean_console()
    self.show_bar()
    puts ''
    puts "  The value for #{stock_name}"
    puts "  in #{date} is US$ #{value}"
    puts ''
    self.show_bar()
  end

  def get_invest_value()
    puts 'Please enter in US$ how much you want to invest: '
  end

  def will_invest_in_stock_with_value(name, value)
    self.clean_console()
    self.show_bar()
    puts ''
    puts "  You choose #{name}"
    puts "    to invest $US #{value}"
    puts ''
    puts '        0: No'
    puts '        1: Yes'
    puts ''
    self.show_bar()
  end

  def delete_alert(stock_name)
    self.clean_console()
    self.show_bar()
    puts ' Are you sure you want to delete'
    puts "#{stock_name} from your Portfolio?"
    puts ''
    puts '          0: No'
    puts '          1: Yes'
    puts ''
    self.show_bar()
  end

  def show_user_stocks(stocks_user, stocks_list)
    self.clean_console()
    self.show_bar()
    puts '             Your Stocks'
    puts ''
    puts '          0: To exit'
        stocks_list.each_with_index do |stock, index|
          if stocks_user.include?(stock.STOCK_NAME)
    puts "          #{index+1}: #{stock.STOCK_NAME}"
          end
        end
    puts ''
    self.show_bar()
  end

  def show_user_stocks_simple(stocks_user)
    self.clean_console()
    self.show_bar()
    puts '             Your Stocks'
    puts ''
    puts '          0: To exit'
        stocks_user.each_with_index do |stock, index|
    puts "          #{index+1}: #{stock}"
        end
    puts ''
    self.show_bar()
  end

  def show_invert_stocks_to_add(stocks_user, stocks_list)
    self.clean_console()
    self.show_bar()
    puts '    Stocks that you can add '
    puts '      0: to exit'
    stocks_list.each_with_index do |stock, index|
      unless stocks_user.include?(stock.STOCK_NAME)
    puts "      #{index+1}: #{stock.STOCK_NAME}"
      end
    end
    puts ''
    self.show_bar()
  end

  def request_two_dates_for_portfolio()
    self.clean_console()
    self.show_bar()
    puts '    Insert a range of'
    puts '  dates to see Portfolio '
    puts ''
    puts '  if you want, you can leave date in blank'
    puts '  to get the first day or last day of the year'
    puts ''
    puts '  First Date: '
  end

  def header_profit_portfolio(first_date, last_date)
    self.clean_console()
    self.show_bar()
    puts '      Portfolio Profit    '
    puts "    First date: #{first_date}"
    puts "    Last date: #{last_date}"
    puts ''
  end

  def stock_profit_portfolio(stock_name, stock_profit, initial_value_user, annualized_return)
    puts '  - - - - - - - - - - - - - - - - - - - - - - -'
    puts "    Stock Name          : #{stock_name}"
    puts "    User initial Invest : #{initial_value_user}"
    puts "    Stock Profit        : #{stock_profit}"
    puts "    Annualized Return   : #{annualized_return}"
    puts '  - - - - - - - - - - - - - - - - - - - - - - -'
  end

  def final_total_profit_and_annualized(profit_portfolio, annualized_value)
    puts ''
    puts '    Total Portfolio profit    '
    puts ''
    puts "  Profit            : #{profit_portfolio}"
    puts "  Annualized value  : #{annualized_value}"
    puts ''
    puts 'Press enter to continue...'
  end

  def request_second_date()
    puts ''
    puts '  Last Date: '
  end

  def stock_deleted()
    puts 'Stock deleted...'
    sleep(1.5)
  end

  def stock_added()
    puts 'Stock added...'
    sleep(1.5)
  end

  def see_other_stock()
    puts 'Don`t worry, let see other stocks'
    sleep(1.5)
  end

  def create_account_username()
    self.clean_console()
    self.show_bar()
    puts 'Enter your new username: '
  end

  def create_account_password()
    puts 'Enter your new password: '
  end

  def wrong_selection()
    puts 'Please enter a valid number...'
    sleep(1.5)
  end

  def user_created(username)
    puts "User created with user_name: #{username}!"
    sleep(1.5)
  end

  def user_exist()
    puts 'This user already exists...'
    sleep(1.5)
  end

  def insert_username()
    puts 'UserName: '
  end

  def insert_password()
    puts 'Password: '
  end

  def wrong_user_or_pass()
    puts 'Wrong username or Password...'
    sleep(1.5)
  end

  def request_one_date()
    puts 'Please enter one date with format: yyyy-mm-dd'
    gets().chomp
  end



end
