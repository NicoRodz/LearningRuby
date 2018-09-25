load './controllers/logs.rb'
load './controllers/utils.rb'

class Stock

attr_accessor :stock_name

  def initialize(stock)
    @logs = Logs.new
    @utils = Utils.new
    @STOCK_NAME = stock
    @stock_data = @utils.get_stock_data(@STOCK_NAME)
  end

  def price(date:)
    @stock_data.each do |i_date, value|
      if date == i_date
        @logs.show_price_in_one_date(date, value, @STOCK_NAME)
        puts 'Press enter to continue...'
        gets()
        return true
      end
    end
    puts 'Date not found, press enter to continue...'
    gets()        
  end

  def present()
    montly_data = @utils.daily_to_montly(@stock_data)
    @logs.show_stock_simple_data(montly_data, @STOCK_NAME)
    gets()
  end

end
