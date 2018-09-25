system 'clear'

###########################################
#      Nicolás Rodríguez Niñoles          #
#      nicolas.jesusrn@gmail.com          #
#     +56 9 5108 6820                     #
###########################################

###########################################
#      Assumptions
#
###########################################

load './controllers/menu.rb'
load './controllers/generator.rb'

generator = Generator.new

unless Dir.exist?("user") && File.exist?("user/users.txt")
  generator.generate_user_file()
end

unless Dir.exist?('stocks')
  generator.generate_stocks_folder()
end

Menu.new.start_app()
