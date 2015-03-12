get '/' do
  @user_session = session[:user_id]
  erb :index
end
