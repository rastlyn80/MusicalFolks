class PagesController < ApplicationController
  def home
    @venues = Venue.where(active: true).limit(3)
  end

  def search
    # STEP 1 - Save the location in a session variable
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2 - If we have a location, then return the venues near to that
    if session[:loc_search] && session[:loc_search] != ""
      @venues_address = Venue.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @venues_address = Venue.where(active: true).all
    end

    # STEP 3 - Use ransack to retrieve all the parameters and save the result of
    # the search inside an array
    @search = @venues_address.ransack(params[:q])
    @venues = @search.result

    @arrVenues = @venues.to_a

    # STEP 4
    if(params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @venues.each do |venue|
        not_available = venue.reservations.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1)

        if not_available.length > 0
          @arrVenues.delete(venue)
        end
      end
    end

  end
end
