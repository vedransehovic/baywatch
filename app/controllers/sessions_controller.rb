class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "Logged in!"
    else
      flash.now[:alert] = "Username or password is invalid"
      render "new"
    end
  end

  def omniauth
    user = User.from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to '/', notice: "Logged in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "Logged out!"
  end

  protected

  def auth
    request.env['omniauth.auth']
  end

end
