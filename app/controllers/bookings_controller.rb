class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :create, :destroy]
  before_action :authenticate_user!

  def show
  end

  def new
    @booking = Booking.new
    @offer = Offer.find(params[:offer_id]) # Définir la variable @offer ici
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.user_id = @user.id
    @offer = Offer.find(params[:offer_id])
    @booking.offer_id = @offer.id # récupérer sur la show de offer l'ID de l'offre
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :hour, :price, :comment, :acceptation)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
