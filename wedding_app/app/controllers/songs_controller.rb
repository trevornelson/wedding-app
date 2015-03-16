class SongsController < ApplicationController

def index

end

def create
  song = Song.new(name: params[:name], artist: params[:artist], url: params[:url])
  if song.valid?
    song.save
    head :ok
  end
end

end
