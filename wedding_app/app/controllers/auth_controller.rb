# What is the nature of this controller.  It is essentially creating a new
# Session and storing the user id in it.  If we were to rename this controller
# to SessionsController, we could utilize it in a RESTful, resourceful way.
#
# SessionsController.create -> Login
# SessionsController.destroy -> Logout
#
class AuthController < ApplicationController

  # def new
  #   user = User.find(session[:user_id])
  #   if user
  #     render json: user
  #   else
  #     head :unauthorized
  #   end
  # end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: @user
    else
      head :unauthorized
    end
  end

end
