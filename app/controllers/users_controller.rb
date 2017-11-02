class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @venues = @user.venues
  end
end