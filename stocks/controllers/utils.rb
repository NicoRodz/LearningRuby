require 'fileutils'

class Utils

  def correct_date(month, day)
    if month < 10
      if day < 10
        return date = "2018-0#{month}-0#{day}"
      else
        return date = "2018-0#{month}-#{day}"
      end
    else
      if day < 10
        return date = "2018-#{month}-0#{day}"
      else
        return date = "2018-#{month}-#{day}"
      end
    end
  end

  def write_stock_data(historic_data:, filename:)
    f = File.new("stocks/#{filename}.txt", 'w')
    f.write(JSON.generate(historic_data))
    f.close
  end

  def profit_stock(value)
    decision = rand(5) < 3 ? true : false
    variation = rand(0.001 .. 0.019)
    if decision
      value = value + value * variation
    else
      value = value - value * variation
    end
  end

  def save_new_user_with_password(username, password)
    data = "#{username}-#{password}\n"
    f = File.new('user/users.txt', 'a')
    f.write(data)
    f.close
    FileUtils.touch("./user/#{username}.txt")
    f_u = File.new("./user/#{username}.txt", 'a')
    f_u.write("{}")
    f_u.close
  end

  def get_all_users()
    users_arr = []
    f = File.new('user/users.txt', 'r')
    f.readlines.each_with_index do |line|
      users_arr.push(line.split('-')[0])
    end
    f.close
    return users_arr
  end

  def check_log_in(user_name, password)
    users_arr = []
    f = File.new("user/users.txt", 'r')
    f.readlines.each_with_index do |line|
      user_name_ = line.split('-')[0].to_s
      password_ = line.split('-')[1].to_s.strip
      if user_name_.eql? user_name
        if password_.eql? password
          f.close
          return true
        end
      end
    end
    f.close
    return false
  end

  def get_stock_data(stock_name)
    f = File.new("stocks/#{stock_name}.txt", 'r')
    data = JSON.parse(f.read)
    f.close
    return data
  end

  def daily_to_montly(stock_data)
    month_to_see = 0
    month_value = 0
    final_data = {}
    index = 0
    stock_data.each do |date, value|
      year, month, day = date.split('-')
      if index == 0 then month_to_see = month end
      index += 1
      if month_to_see == month
        month_value += value
      else
        month_date = "2018-#{month_to_see}"
        final_data[month_date] = month_value/30
        month_value = 0
        month_to_see = month
      end
    end
    month_date = "2018-#{month_to_see}"
    final_data[month_date] = month_value/30
    return final_data
  end

  def get_user_portfolio(username)
    f = File.new("user/#{username}.txt", 'r')
    stocks = f.read
    f.close
    return JSON.parse(stocks)
  end

  def save_new_stock_for_user(stock, invest, username)
    portfolio = self.get_user_portfolio(username)
    portfolio[stock] = invest
    f = File.new("user/#{username}.txt", 'w')
    f.write(JSON.generate(portfolio))
    f.close
  end

end
