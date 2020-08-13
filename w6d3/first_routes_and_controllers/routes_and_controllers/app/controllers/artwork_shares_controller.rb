class ArtworkSharesController < ApplicationController
    def create
        @artwork_share = ArtworkShare.new(artwork_shares_params)

        if @artwork_share.save
            redirect_to artwork_url(@artwork_share.artwork_id)
        else
            render json: @artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        @artwork_share.destroy
        render json: @artwork_share
    end

    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end