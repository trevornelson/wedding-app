get '/gifts' do
  @gifts = Gift.where(purchased: false)
  @session_user = User.find(session[:user_id])
  erb :'gifts/index'
end

get '/gifts/create' do
  admin = Admin.find(session[:user_id])
  if admin
    erb :'gifts/_create'
  else
    erb :'content/_error', :locals => {error_title: "I can't do that, Dave.",
                                        error_description: "Sorry, you don't have access to that page."}
  end
end

post '/gifts' do
  gift = Gift.new(params)
  if gift.valid?
    gift.save
    redirect '/'
    # redirect '/gifts/success'
  else
    redirect '/'
    # redirect '/gifts/error'
  end
end

put '/gifts/:id' do
  gift = Gift.find(params[:id])
  gift.mark_as_purchased
  redirect '/gifts/update-success'
end

get '/gifts/update-success' do
  erb :'content/_success', :locals => {success_title: "Ooo, nice one!",
                                        success_description: "No worries, we can't see who bought what. Your surprise is safe!"}
end

get '/gifts/success' do
  erb :'content/_success', :locals => {success_title: "All good.",
                                        success_description: "Gift added to the registry."}
end

get '/gifts/error' do
  erb :'content/_error', :locals => {error_title: "Hmm... something went wrong.",
                                        error_description: "Did you forget something?"}
end
