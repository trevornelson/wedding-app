class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render partial: "show"
  end

  def update
    @user = User.find(params[:id])
    @user.update({status: params[:status], number_in_party: params[:number_in_party]})
    @user.save
    render json: @user
  end

end
