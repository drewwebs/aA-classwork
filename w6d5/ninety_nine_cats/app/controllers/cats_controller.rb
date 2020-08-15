class CatsController < ApplicationController

    def index
        @cat = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        # debugger
        if @cat.save
            # debugger
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:id, :birth_date, :name, :color, :sex, :description)
    end
end
