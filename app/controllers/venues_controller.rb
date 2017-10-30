class VenuesController < ApplicationController
  before_action :set_venue, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [
                          :listing, :pricing, :description, 
                          :photo_upload, :amenities, :location, :update]

  def index
    @venues = current_user.venues
  end

  def new
    @venue = current_user.venues.build
  end

  def create
    @venue = current_user.venues.build(venue_params)   
    if @venue.save
      redirect_to listing_venue_path(@venue), notice: "Venue saved successfully!"
    else
      flash[:alert] = "Something went wrong when saving your venue..."
      render :new
    end 
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photo = @venue.photos
  end

  def amenities
  end

  def location
  end

  def update
    if @venue.update(venue_params)
      flash[:notice] = "Changes saved successfully!"
    else
      flash[:alert] = "Something went wrong when saving your changes"
    end  
    redirect_back(fallback_location: request.referer)
  end

  private
  def set_venue
    @venue = Venue.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: "You don't have permission to access this page!" unless current_user.id == @venue.user_id
  end

  def venue_params
    params.require(:venue).permit(:listing_name, 
                                  :venue_type, 
                                  :description, 
                                  :address, 
                                  :max_guests, 
                                  :instruments, 
                                  :preferred_style, 
                                  :hosts_events, 
                                  :has_recording, 
                                  :has_wifi, 
                                  :has_heating, 
                                  :has_conditioning, 
                                  :price, 
                                  :active )
  end
end
