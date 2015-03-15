class GiftsController < ApplicationController

  def index
    @gifts = Gift.all
    render partial: "index"
  end

end
