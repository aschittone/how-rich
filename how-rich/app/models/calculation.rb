class Calculation

  attr_accessor :search, :start_date, :end_date, :shares, :invested_money, :buy_price, :sell_price, :name, :ticker_symbol

  def initialize(search)
    @start_date = search.start_date
    @end_date = search.end_date
    @buy_price = search.buy_price
    @sell_price = search.sell_price
    @shares = (search.investment_amount / buy_price).floor
    @invested_money = (shares * buy_price).round(2)
    @name = search.stock.name
    @ticker_symbol = search.stock.ticker_symbol
    @search = search
    do_update
  end

  def do_update
    search.update(profit: profit, total_return: total_return, annual_return: annual_return, invested_money: invested_money, shares: shares, investment_timeframe: investment_timeframe)
  end

  def profit
    ((sell_price - buy_price) * shares).round(2)
  end

  def total_return
    (profit / invested_money).round(2) * 100
  end

  def annual_return
    if end_date.year == start_date.year
      return total_return
    end
    (total_return / investment_timeframe).round(2) * 100
  end


  def investment_timeframe
    end_date.year - start_date.year
  end

end
  # def total_roi
  #   ((total_profit / investment_amount)*100).round(2)
  # end
  #
  # def total_profit
  #   gross_profit = (sell_price - buy_price) * shares
  #   gross_profit - investment_amount.round(2)
  # end
  #
  # def annual_return
  #   (total_roi / timeline).round(2)
  # end
  #
  # def timeline
  #   end_date.year - start_date.year
  # end
  #
  # def annual_profit
  #   (total_profit / timeline).round(2)
  # end
