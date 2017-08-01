class SearchesController < ApplicationController

  def index
  end

  def new
    @search = Search.new
  end

  def create
    search = Search.create(search_params)
    stock = Stock.find_by(stock_params)
    stock.searches << search
    stock_quote = MarketBeat.quotes(stock.ticker_symbol, search.start_date, search.end_date)

    search.update(buy_price: stock_quote.first[:low].to_f, sell_price: stock_quote.last[:high].to_f)
    @calculation = Calculation.new(search)
    render :stock_search
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
