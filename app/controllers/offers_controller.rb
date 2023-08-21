class OffersController < ApplicationController
before_action :set_offer, only: [:show, :edit, :update, :create, :destroy]

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @user = current_user
    @offer.user_id = @user
    if @offer.save
      redirect_to @offer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  def index
    @offers = Offer.all
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to @offer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:availability, :pricing, :social_media, :style, :content)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
