class HostReviewsController < ApplicationController

    def create
        # Check if the reservation exists (venue_id, guest_id, host_id)

        # Check if current host already reviewed the guest in this reservation.
        
        @reservation = Reservation.where(
                        id: host_review_params[:reservation_id],
                        venue_id: host_review_params[:venue_id],
                        user_id: host_review_params[:guest_id]
                        ).first
        
        if !@reservation.nil?
            @has_reviewed = HostReview.where(
                            reservation_id: @reservation.id,
                            guest_id: host_review_params[:guest_id]
                            ).first
            if @has_reviewed.nil?
                #Allow Review
                @host_review = current_user.host_reviews.create(host_review_params)
                flash[:success] = "Review created successfully!"                
            else
                #Already Reviewed
                flash[:notice] = "You have already left a review for this reservation."
            end
        else
            flash[:alert] = "Reservation not found."
        end
        redirect_back(fallback_location: request.referrer)
    end

    def destroy
        @host_review = Review.find(params[:id])
        @host_review.destroy

        redirect_back(fallback_location: request.referrer, notice: "Review successfully removed.")
    end

    private
    def host_review_params
        params.require(:host_review).permit(:comment, :star, :venue_id, 
                                    :reservation_id, :guest_id)
    end
end