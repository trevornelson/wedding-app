class GiftsController < ApplicationController

  # This method is doing too much.  Controller should be kept lean - usually
  # creating a single object and passing it to the view.  The @new_gift object
  # is only being used in the view if the user is an admin.  You can probably
  # just create the Gift.new() object in the view if it is needed.

  # Also - I have a feeling that the method to find the current user and pass
  # it to the view is something that will happen throughout your controllers.
  # I think it may be worthwhile to have a method defined in your
  # ApplicationController:
  #
  # def current_user()
  #   @current_user ||= User.find(session[:user_id])
  # end
  #
  # Then in your other controllers you can utilize that method, or even use
  # something like this to have it available throughout your views:
  #
  # before_action :current_user
  #
  # Rendering a partial from your index method is also a bit of an oddity.
  #
  # The proper thing is to respond to both ajax requests and html requests as follows:
  #
  # respond_to do |format|
  #   format.html { render :index }
  #   format.js { render partial: "index" }
  # end
  #
  # Then your ajax requests will call /gifts.js and your html reqs would just call /gifts

  # Ultimately, I think this index method has too much complexity wrapped up in what
  # its doing... especially as you delve down through the rendered partials
  def index
    @gifts = Gift.all
    @new_gift = Gift.new()
    @user = User.find(session[:user_id])
    render partial: "index"
  end

  def create
    # How is this different than:
    # gift = Gift.new(gift_params)
    # gift.save
    # ?
    #
    # If gift.valid? is false, wont the save fail (and return false)?
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
