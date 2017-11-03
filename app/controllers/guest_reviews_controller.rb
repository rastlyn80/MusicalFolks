class GuestReviewsController < ApplicationController
    
        def create
            # Check if the reservation exists (venue_id, host_id, host_id)
    
            # Check if current host already reviewed the guest in this reservation.
            
            @reservation = Reservation.where(
                            id: guest_review_params[:reservation_id],
                            venue_id: guest_review_params[:venue_id]
                            ).first
            
            if !@reservation.nil? && @reservation.venue.user.id == guest_review_params[:host_id].to_i                
                @has_reviewed = GuestReview.where(
                                reservation_id: @reservation.id,
                                host_id: guest_review_params[:host_id]
                                ).first
                if @has_reviewed.nil?
                    #Allow Review
                    @guest_review = current_user.guest_reviews.create(guest_review_params)
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
            @guest_review = Review.find(params[:id])
            @guest_review.destroy
    
            redirect_back(fallback_location: request.referrer, notice: "Review successfully removed.")
        end
    
        private
        def guest_review_params
            params.require(:guest_review).permit(:comment, :star, :venue_id, 
                                        :reservation_id, :host_id)
        end
    end