class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_action :authenticate_user!, only: %i[new create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
