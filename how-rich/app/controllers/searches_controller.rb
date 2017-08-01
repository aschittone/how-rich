class SearchesController < ApplicationController

  def index
  end

  def new
    @search = Search.new
  end

  def create
    search = Search.create(search_params)
    stock = Stock.find_by(stock_params)
    # make sure ticker_symbols are up case when inputted
    stock.searches << search
    stock_quote = MarketBeat.quotes(stock.ticker_symbol, search.start_date, search.end_date)
    search.update(sell_price: stock_quote.first[:low].to_f, buy_price: stock_quote.last[:high].to_f)
    if search.start_date < stock_quote.last[:date]
      flash[:message] = "This stock was not around at that time!"
      render :new
    elsif search.buy_price > search.investment_amount
      flash[:message] = "That isn't enough to buy one share! The price per share on that day was #{search.buy_price}"
      render :new
    else
      @calculation = Calculation.new(search)
      render :stock_search
    end
  end

  private
  #q .require vs .permit
  def search_params
    params.require(:search).permit(:start_date, :end_date, :investment_amount)
  end

  def stock_params
    params.require(:stock).permit(:ticker_symbol)
  end
end
