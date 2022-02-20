class SessionsController < ApplicationController
  before_action :authenticate_user, only: :new

  def create
    user = User.find_by(name: params[:session][:name].capitalize)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash.notice = 'You are successfully logged in'
      redirect_to root_path
    else
      flash.now.alert = 'Username or Password is incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = 'Successfully Logged Out'
    redirect_to root_path
  end
end
