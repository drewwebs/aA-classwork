class AlbumsController < ApplicationController
    def index
        @albums = Album.where(band_id = @band.id)
        render :index
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    
    private
    def album_params
        params.require(:album).permit(:title, :year, :studio?, :band_id)
    end

end