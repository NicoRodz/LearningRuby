system 'clear'

###########################################
#      Nicolás Rodríguez Niñoles          #
#      nicolas.jesusrn@gmail.com          #
#          +56 9 5108 6820                #
###########################################

###########################################
#           Assumptions
# => 1.- User invest always at 01/01/2018 to 31/12/2018
# => 2.- There is only 4 stocks for the demo
# => 3.- Password and invest data for the users is encrypted
# => 4.- if you don't write date, is equal to the first or last day in period
# => 5.- The year have 12 months each with 31 days, as that, year have 372 (correction for AR)
# => 6.- User can invest any month for a stock, not only integer part of that.
# => 6.- Look user files... 
###########################################

# https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest/MD5.html
#https://gist.github.com/wteuber/5318013#file-encrypt_decrypt-rb-L9

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
