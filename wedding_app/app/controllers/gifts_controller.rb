class GiftsController < ApplicationController

  def index
    @gifts = Gift.all
    @new_gift = Gift.new()
    @user = User.find(session[:user_id])
    render partial: "index"
  end

  def create
    g = gift_params
    gift = Gift.new(g)
    if gift.valid?
      gift.save
    end
    redirect_to "/"
  end


  private

  def gift_params
    params.require(:gift).permit(:title, :category, :url, :gift_img)
  end

end
