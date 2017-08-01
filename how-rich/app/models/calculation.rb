class Calculation

  attr_accessor :start_date, :end_date, :investment_amount, :buy_price, :sell_price, :name, :ticker_symbol

  def initialize(search)
    @start_date = search.start_date
    @end_date = search.end_date
    @buy_price = search.buy_price
    @sell_price = search.sell_price
    @investment_amount = search.investment_amount
    @name = search.stock.name
    @ticker_symbol = search.stock.ticker_symbol
  
  end

  def shares
    (investment_amount / buy_price).round
  end

  def total_roi
    ((total_profit / investment_amount)*100).round(2)
  end

  def total_profit
    gross_profit = (sell_price - buy_price) * shares
    gross_profit - investment_amount
  end

  def annual_return
    (total_roi / timeline).round(2)
  end

  def timeline
    end_date.year - start_date.year
  end

  def annual_profit
    (total_profit / timeline).round(2)
  end


end
