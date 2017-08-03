class SearchesController < ApplicationController

  def new
    @all_searches = Search.all
    if current_user
      @user_searches = Search.where(user_id: "#{current_user.id}")
    end
  end

  def show
    @search = Search.find_by(id: params[:id])
    @user_searches = Search.where(user_id: "#{current_user.id}")
    @stock = @search.stock
  end

  def create
    @search = Search.new(search_params)
    @stock = Stock.find_by(stock_params)
    # make sure ticker_symbols are up case when inputted
    stock_quote = MarketBeat.quotes(@stock.ticker_symbol, @search.start_date, @search.end_date)
    if @search.start_date < stock_quote.last[:date]
      flash[:message] = "#{@stock.name} was not around at that time!"
      render :new
    elsif stock_quote.last[:high].to_f > @search.investment_amount
      flash[:message] = "That isn't enough to buy one share! The price per share on that day was #{@search.buy_price}"
      render :new
    else
      @search.save
      @stock.searches << @search
      @search.update(sell_price: stock_quote.first[:low].to_f, buy_price: stock_quote.last[:high].to_f)
      Calculation.new(@search)
      if current_user
        current_user.searches << @search
        @user_searches = Search.where(user_id: "#{current_user.id}")
      end
      @all_searches = Search.all
      redirect_to search_path(@search)
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
