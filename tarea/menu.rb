load 'user.rb'

class Menu

  def initialize()
    @@User = User.new
  end

  def show_init_menu()
    # system "clear"
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
    @@User.create_new_user(name)
  end

  def show_users()
    @@User.see_all_users()
    puts "Enter number of your user: "
    user_index = gets().chomp
    menu_user(user_index)
  end

  def menu_user(user_index)
    @@User.get_user_name(user_index)
    in_menu = 1
    while in_menu
      system "clear"
      puts "Welcome #{@@User.name.chomp}.-"
      puts "0: to Exit"
      puts "1: To see Profit"
      puts "2: To create Profit"
      in_menu = gets().chomp.to_i
    end

    show_init_menu() ##return back to the main menu
  end

end
