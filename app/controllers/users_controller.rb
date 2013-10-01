class UsersController < ApplicationController
  before_filter :authorize, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thanks for signing up!"
      session[:user_id] = @user.id
      redirect_to new_url_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @url = Url.new
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end