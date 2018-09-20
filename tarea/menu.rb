load 'user.rb'
require 'timeout'

class Menu

  attr_accessor :portfolio
  def initialize()
    @portfolio = Portfolio.new
  end

  def show_init_menu()
    system "clear"
    puts "Welcome to Fintonic Portfolio"
    puts "0: If you have an user"
    puts "1: For new User"
    puts "2: To see Stocks"
    # TODO: Modificar y agergar el tema de las divisas
    if gets().chomp.to_i == 1
      create_new_user()
    else
      show_users()
    end
  end

  def create_new_user()
    system "clear"
    puts "Enter Name for new User: "
    name = gets().chomp
    @portfolio.create_new_user(name)
    puts "User Created as... #{name}"
    sleep(1.5)
    show_init_menu()
  end

  def show_users()
    unless @portfolio.check_user_file()
      puts "there are no users yet..."
      sleep(1)
      show_init_menu()
    end
    @portfolio.see_all_users()
    puts "Enter number of your user: "
    user_index = gets().chomp
    menu_user(user_index)
  end

  def will_see_portfolio(user_index)
    system "clear"
    puts "--------Portfolio Menu---------"
    puts "0: to back"
    puts "1: See annualized return"
    puts "2: See return between two dates"
    puts "--------------------------------"
    portfolio_select = gets().chomp.to_i
    case portfolio_select
    when 0
      menu_user(user_index)
    when 1
      @portfolio.show_annualized_return()
      puts "Press enter to exit"
      gets()
    when 2
      puts "Enter first date to see: (yyyy-mm)"
      first_date = gets().chomp.to_s
      puts "Enter last date to see: (yyyy-mm)"
      last_date = gets().chomp.to_s
      @portfolio.see_portfolio(first_date: first_date.to_s, last_date: last_date.to_s)
      puts "Press enter to exit"
      gets()
    else
      puts "Please enter valid number"
    end
  end

  def menu_user(user_index)
    @portfolio.get_user_name(user_index)
    if @portfolio.index != user_index
      puts "this user not exist, enter valid id..."
      sleep(2)
      show_users()
    end
    in_menu = 1
    while in_menu != 0
      system "clear"
      puts "-.Welcome #{@portfolio.name.chomp}.-"
      puts "0: to Exit"
      puts "1: To see Profit"
      puts "2: To create Profit"
      in_menu = gets().chomp.to_i
      case in_menu
        when 0
          puts "GoodBye! :)!"
          sleep(1)
        when 1
          unless @portfolio.check_portfolio_exist()
            puts "Create Portfolio first please..."
            sleep(1)
            menu_user(user_index)
          end
          will_see_portfolio(user_index)
          sleep(2)
        when 2
          @portfolio.create_new_portfolio()
          sleep(4)
        else
          puts "Enter valid number Please.."
          sleep(2)
      end
    end
    show_init_menu() ##return back to the main menu
  end
end
