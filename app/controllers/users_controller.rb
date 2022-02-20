class UsersController < ApplicationController
  before_action :authenticate_user

  def new
    @user = User.new
  end

  def create
    params[:user][:name].capitalize!
    @user = User.new(form_params)
    if @user.save
      flash.notice = 'User successfully created'
      redirect_to root_path
    else
      flash.now.alert = 'User could not be created'
      render :new
    end
  end

  private

  def form_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
