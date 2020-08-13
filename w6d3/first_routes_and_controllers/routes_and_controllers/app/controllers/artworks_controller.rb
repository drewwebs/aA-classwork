class ArtworksController < ApplicationController
    before_action :set_artwork, only: [:show, :update, :destroy]

    def index
        # @artworks_owned = Artwork.where(artist_id: params[:user_id]) 
    
        @artworks = Artwork.left_outer_joins(:artwork_shares).where("artwork_shares.viewer_id = :user_id OR artworks.artist_id = :user_id", user_id: params[:user_id])

        render json: @artworks
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def show
        render json: @artwork
    end

    def update
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork.destroy
        redirect_to artworks_url
    end

    private

    def set_artwork
        @artwork = Artwork.find(params[:id])
    end

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
