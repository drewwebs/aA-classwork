class Api::SessionController < ApplicationController
    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user.nil?
            render json: ['Invalid credentials'], status: 401
        else
            login!(@user)
            render 'api/users/show'
        end
    end

    def destroy
        if logout!
            render json: {}
        else
            render json: status: 404
        end
    end
end
