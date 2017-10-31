class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def create
        venue = Venue.find(params[:venue_id])

        if current_user == venue.user
            flash[:alert] = "You cannot book your own venue!"
        else
            start_date = Date.parse(reservation_params[:start_date])
            end_date = Date.parse(reservation_params[:end_date])
            days = (end_date - start_date).to_i + 1
            
            @reservation = current_user.reservations.build(reservation_params)
            @reservation.venue = venue
            @reservation.price = venue.price
            @reservation.total = venue.price * days
            @reservation.save

            flash[:notice] = "Reserved Successfully"
        end
        redirect_to venue
    end

    private
    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date)
    end
end