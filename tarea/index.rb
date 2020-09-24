=begin

      Nicolás Rodríguez
      nicolas.jesusrn@gmail.com
      
=end



load 'user.rb'
load "menu.rb"
require "fileutils"
system "clear"

unless Dir.exist?("data") && File.exist?("data/users.txt") #si existe
  Dir.mkdir("data")
  FileUtils.touch("./data/users.txt")
end


Menu.new.show_init_menu()

# nico = Portfolio.new

# menu -> divisas
# mensualmente
# evaluar una fecha
# annualized return
