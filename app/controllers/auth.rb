get '/auth/login' do
  erb :'/auth/_login', :layout => false
end

post '/auth/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/auth/error'
  end
end

get '/auth/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/auth/error' do
  erb :'content/error', :locals => {error_title: "Sorry, login failed.",
                                    error_description: "hint: Your password is your mailing zip code."}
end
