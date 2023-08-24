class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def dashboard
    @user = current_user
    @offers = @user.offers
    @bookings = @user.bookings
    @reviews = @user.reviews unless @user.reviews.empty?
  end
end
