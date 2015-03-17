class SongsController < ApplicationController

def index

end

def create
  song = Song.new(name: params[:name], artist: params[:artist], url: params[:url])
  # Same comment applies as other controllers - why check for the validity?  Save
  # will not work unless it is valid.
  if song.valid?
    song.save
    head :ok
  end
end

end
