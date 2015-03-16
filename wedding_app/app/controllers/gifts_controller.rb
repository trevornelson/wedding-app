class GiftsController < ApplicationController

  def index
    @gifts = Gift.all
    @user = User.find(session[:user_id])
    render partial: "index"
  end

end
