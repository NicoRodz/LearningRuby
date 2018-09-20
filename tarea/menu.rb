load 'user.rb'

class Menu

  def initialize()
    @@User = User.new
  end

  def show_init_menu()
    puts "Welcome to Fintonic Portfolio"
    puts "Press 1 for new user, 0 for existing user"
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
    @@USer.see_all_users()
  end

end
