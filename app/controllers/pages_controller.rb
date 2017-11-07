class PagesController < ApplicationController
  def home
    @venues = Venue.where(active: true).limit(3)
  end
end
