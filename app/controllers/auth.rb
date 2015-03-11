get '/auth/login' do
  erb :'/auth/_login'
end

post '/auth/login' do
  user = User.find_by(params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/' #### How should this be handled with AJAX posts?
  end
end

get '/auth/logout' do
  session[:user_id] = nil
  redirect '/'
end
