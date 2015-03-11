post '/prompts/:id/notes' do
  note = Note.new(prompt_id: params[:id],
                  content: params[:content],
                  user_id: session[:user_id])
  if note.valid?
    note.save
    redirect '/notes/success'
  else
    redirect '/notes/error'
  end
end

get '/notes' do
  notes = Note.includes(:user, :prompt).all
  admin = Admin.find(session[:user_id])
  if admin
    erb :'notes/_index'
  else
    erb :'content/_error', :locals => {error_title: "Whoopsie Poopsie!",
                                        error_description: "You need to be an admin to view the guest notes."}
  end
end

get '/notes/success' do
  erb :'content/_success', :locals => {success_title: "Success!",
                                        success_description: "Thanks for the note!"}
end

get '/notes/error' do
  erb :'content/_success', :locals => {success_title: "Hmm, something went wrong.",
                                        success_description: "Check your note and give it another shot."}
end
