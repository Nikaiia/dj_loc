class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: :show
  
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new(params[:rating :content :id_user :booking_id])
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review
      redirect_to review_path(@review)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
