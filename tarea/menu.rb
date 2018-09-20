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
    puts "Press 0 if you have an User, 1 for new User"
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
    @portfolio.see_all_users()
    puts "Enter number of your user: "
    user_index = gets().chomp
    menu_user(user_index)
  end

  def menu_user(user_index)
    @portfolio.get_user_name(user_index)
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
        puts "Adios :)!"
        sleep(1)
      when 1
        puts "Enter first date to see: (yyyy-mm-dd)"
        first_date = gets().chomp.to_s
        puts "Enter last date to see: (yyyy-mm-dd)"
        last_date = gets().chomp.to_s
        @portfolio.see_portfolio(first_date: first_date.to_s, last_date: last_date.to_s)
        sleep(2)
      when 2
        @portfolio.create_new_portfolio()
        sleep(2)
      else
        puts "Enter valid number Please.."
        sleep(2)
      end
    end
    show_init_menu() ##return back to the main menu
  end

end
