class AuthController < ApplicationController

  def new
    user = User.find(session[:user_id])
    if user
      render json: user
    else



  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      head :created
    else
      head :unauthorized
    end
  end

end
