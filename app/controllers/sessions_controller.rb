class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash.notice = 'You are successfully logged in'
      redirect_to root_path
    else
      flash.now.alert = 'Sorry Something went wrong'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = 'Successfully Logged Out'
    redirect_to root_path
  end
end
