class PhotosController < ApplicationController

    def create
        @venue = Venue.find(params[:venue_id])

        if params[:images]
            params[:images].each do |img|
                @venue.photos.create(image: img)
            end

            @photos = @venue.photos
            redirect_back(fallback_location: request.referer, notice: "Saved!")
        end
    end
end