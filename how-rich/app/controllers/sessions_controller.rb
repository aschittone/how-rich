class SessionsController < ApplicationController

  def new
  end

  def create
    byebug
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Nice try sucker!"
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
