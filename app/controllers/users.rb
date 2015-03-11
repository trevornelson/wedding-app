get '/users/create' do
  user = Admin.find(session[:user_id])
  if user
    erb :'users/_create'
  else
    erb :'content/_error', :locals => {error_title: "Whoopsie Poopsie!",
                                        error_description: "You need to be an admin to create users."}
  end
end

post '/users' do
  user = User.new(params)
  if user.valid?
    user.save
    erb :'content/_success', :locals => {success_title: "Great Success!",
                                          success_description: "New user successfully created."}
  else
    erb :'content/_error', :locals => {error_title: "Shucks.",
                                        error_description: "User wasn't created. Check your inputs and try again!"}
  end
end
