class UsersController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :session_token)
    end
end