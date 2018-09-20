load 'user.rb'
load "menu.rb"
require "fileutils"


system "clear"

unless File.file?('data.txt') #si existe
  puts "no existe"
  FileUtils.touch("./data.txt")
end
show_init_menu()




# File.open('data.txt').each do |line|
#   puts line
# end


# nico = Portfolio.new
