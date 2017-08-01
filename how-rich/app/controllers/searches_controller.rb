class SearchesController < ApplicationController

  def index
  end

  def new
    @search = Search.new
  end

  def create
    byebug
    @stock = params[:stock]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @stock_quote = MarketBeat.quotes(@stock, @start_date, @end_date)
    render :show_stock
  end




end
