require 'json'

class Stocks
  attr_accessor :name
  def initialize()
    @name
  end

  def price(date: "")
    system "clear"
    f = File.new("divisas/#{@name}.txt", 'r')
    data = JSON.parse(f.read)
    f.close
    if date == "" then puts "No Data, show all year price of #{name}... \n" else puts "Showing Price data for #{name}"  end
      puts ""
    data.each do |path, price|
      if date != ""
        month_to_see = path.split("-")[1].to_i
        if month_to_see == date.split("-")[1].to_i
          puts "Price in date #{date} is $#{price}"
        end
      else
        puts "In date #{path}, the price is $#{price}"
      end
    end
    puts ""
    puts "Press enter to continue"
    gets()
  end

  def profit(date1: "", date2: "")
    if date1 == "" then date1 = "2018-01" end
    if date2 == "" then date2 = "2018-12" end
    first_month = date1.split("-")[1].to_i
    last_month = date2.split("-")[1].to_i
    first_value = 0
    second_value = 0
    f = File.new("divisas/#{@name}.txt", 'r')
    data = JSON.parse(f.read)
    f.close
    system "clear"
    puts "Showing profit for #{@name} beween #{date1} and #{date2}"
    data.each do |path, price|
      month_to_see = path.split("-")[1].to_i
      if month_to_see == first_month then first_value = price end
      if month_to_see == last_month then second_value = price end
    end
    puts ""
    puts "First month price:        $#{first_value}"
    puts "Last month price:         $#{second_value}"
    puts "Utility:                  $#{second_value - first_value}"
    puts "In percentaje of Growth:  #{((second_value * 100) / first_value) - 100}%"
    month_variation = last_month - first_month + 1
    annualized(month_variation, first_value, second_value)
    puts ""
    puts "Annualized return based on monthly period"
    puts ""
    puts "Press enter to Continue"
    gets()
  end

  def annualized(months, first_value, second_value)
    r = ((second_value.to_f - first_value.to_f) / first_value.to_f ).round(3)
    # puts "R: #{r}"
    # puts "months #{months}"
    # puts "1: #{1+r}"
    # 1->12
    # x->2
    # puts "2: #{(1+r)**(1/months.to_f)}"
    ra = ((1+r)**(1/(months.to_f/12))-1)
    # puts "RA: #{ra}"
    # puts "R: #{r}"
    # puts "Months: #{months}"
    puts "Annualized return:        #{(ra*100).round(2)}%"
  end
end
