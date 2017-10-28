class VenuesController < ApplicationController
  before_action :set_venue, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

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
      render :new, notice: "Something went wrong when saving your venue..."
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
  end

  def amenities
  end

  def location
  end

  def update
    if @venue.update(venue_params)
      flash[:notice] = "Changes saved successfully!"
    else
      flash[:notice] = "Something went wrong when saving your changes"
    end  
    redirect_back(fallback_location: request.referer)
  end

  private
  def set_venue
    @venue = Venue.find(params[:id])
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
