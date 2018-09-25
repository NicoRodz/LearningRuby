load './controllers/logs.rb'
load './controllers/security.rb'
load './controllers/utils.rb'

class User
  attr_accessor :username

  def initialize()
    @logs = Logs.new
    @sec = Security.new
    @utils = Utils.new
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
      self.handle_user_menu(user_name)
    else
      @logs.wrong_user_or_pass()
    end
  end

  def handle_user_menu(user_name)
    @username = user_name
    @logs.user_menu(@username)
    option = gets().chomp.to_i
    case option
      when 0
        @username = ''
      when 1
        puts 'falta este menu por hacer'
        sleep(2)
      when 2
        puts 'falta este menu tambien por hader'
        sleep(2)
      else
        @logs.wrong_selection()
        handle_user_menu(@username)
    end
  end

end
