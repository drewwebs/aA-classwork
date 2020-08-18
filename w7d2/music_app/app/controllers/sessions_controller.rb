class SessionsController < ApplicationController
    
    def new
        @user = User.new
        render :new
    end

    def create
        # debugger
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        
        if user
            login!(user)
            redirect_to bands_url
        else
            flash.now[:errors] = ["Invalid credentials!"]
            render :new, status: 422
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
