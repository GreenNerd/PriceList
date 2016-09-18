class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      # login user, redirect tot user's profile
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid user/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
