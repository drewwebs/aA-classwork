class Api::UsersController < ApplicationController

    def create
        # debugger
        @user = User.new(user_params)
        # debugger
        if @user.save
            login!(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 401
        end
    end

    def index
        @user = User.all
    end

    def show
        @user = selected_user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
