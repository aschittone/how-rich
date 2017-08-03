class UsersController < ApplicationController

  def new
    render :new
    # redirect_to user_path(@current_user) if logged_in?
  end

  def create
    if params[:user][:password] != params[:confirm_password]
      flash[:message] = "Your passwords didn't match!"
      render :new
    else
      @user = User.new(user_params)
      if !@user.save
        render :new
      else
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @user_searches = Search.where(user_id: @user.id)
    @all_searches = Search.all
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
