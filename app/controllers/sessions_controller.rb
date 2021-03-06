class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        remember user
        redirect_back_or user
      else
        flash[:warning] = "Account not activated, please check your email for an activation link."
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
