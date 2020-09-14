class Api::PokemonController < ApplicationController
    def index
        @pokemon = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)

        if @pokemon.save
            redirect_to api_pokemon_url(@pokemon.id)
        else
            # render the react errors object?
        end
    end

    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :moves, :image_url)
    end
end
