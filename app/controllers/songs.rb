get '/songs' do
  admin = Admin.find(session[:user_id])
  @songs = Song.includes(:user).all
  if admin
    erb :'songs/_index'
  end
end

get '/songs/add' do
  erb :'songs/_add'
end

post '/songs' do
  song = Song.new(params)
  song[:user_id] = session[:user_id]
  if song.valid?
    song.save
    redirect '/songs/success'
  else
    redirect '/songs/error'
  end
end

get '/songs/success' do
  erb :'content/_success', :locals => {success_title: "Thanks!",
                                        success_description: "Get yer dancin' shoes ready."}
end

get '/songs/error' do
  erb :'content/_error', :locals => {error_title: "Hmm... something went wrong.",
                                      error_description: "Double check your inputs and try again."}
end
