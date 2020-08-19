class AlbumsController < ApplicationController
    before_action :get_band, only: :index
    before_action :set_album, only: [:edit, :update]

    def index
        @albums = @band.albums
        render :index
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to albums_url
        else
            render :new
        end
    end

    def edit
        render :edit
    end

    def update 
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            render json: @album.errors.full_messages, status: 422
        end
    end
    
    def destroy
        @album.destroy

        redirect_to albums_url
    end

    private
    def album_params
        params.require(:album).permit(:title, :year, :studio?, :band_id)
    end

    def set_album
        @album = Album.find(params[:id])
    end

    def get_band
        @band = Band.find(params[:band_id])
    end

end