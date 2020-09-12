class SubsController < ApplicationController
    before_action :get_sub, only: [:show, :update, :edit]
    before_action :ensure_logged_in, only: [:new, :create, :edit, :update]

    def new
        @sub = Sub.new
        render :new
    end
    
    def index
        @subs = Sub.all
        render :index
    end

    def show
        @posts = @sub.posts
        render :show
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        if is_current_user?(@sub.user_id)
            render :edit 
        else
            flash[:errors] = ["You are not the owner of this sub!"]
            redirect_to sub_url(@sub)
        end
    end

    def update
        if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :user_id)
    end

    def get_sub
        @sub = Sub.find(params[:id])
    end
end
