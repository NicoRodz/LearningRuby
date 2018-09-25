class Logs

  def clean_console()
    system 'clear'
  end

  def welcome()
    self.clean_console()
    puts '#####################################'
    puts '  Welcome to Fintual Stocks Admin system'
    puts '     0: To see Stock in a specific date'
    puts '     1: To see Stocks'
    puts '     2: Log In'
    puts '     3: Create User'
    puts '#####################################'
  end

  def user_menu(user_name)
    self.clean_console()
    puts '##############################################'
    puts "  Welcome to Fintual Stocks menu #{user_name}"
    puts '     0: To Exit'
    puts '     1: To make an Portfolio'
    puts '     2: To see an Portfolio between two dates'
    puts '#############################################'
  end

  def show_stock_list(with_date)
    self.clean_console()
    puts '#####################################'
    if with_date then puts '  Stocks List to see in one date' else puts '            Stocks List' end
    puts '          0: To exit'
    puts '          1: NASDAQ: GOOGL'
    puts '          2: NASDAQ: AMZN'
    puts '          3: NYSE: JPM'
    puts '          4: NYSE: BRKA'
    puts '#####################################'
  end

  def show_stock_simple_data(montly_data, stock_name)
    self.clean_console()
    puts '######################################'
    puts "Data for Stock: #{stock_name}"
    puts '                              '
    puts '  Date      AVG Month value '
    montly_data.each do |date, value|
      puts "  #{date}     US$ #{value} "
    end
    puts ''
    puts 'Press enter to continue...'
  end

  def show_price_in_one_date(date, value, stock_name)
    self.clean_console()
    puts '#####################################'
    puts ''
    puts "  The value for #{stock_name}"
    puts "  in #{date} is US$ #{value}"
    puts ''
    puts '#####################################'
  end

  def create_account_username()
    self.clean_console()
    puts '#####################################'
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
