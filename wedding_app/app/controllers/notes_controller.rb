class NotesController < ApplicationController

  def create
    ## Cleaner would be:
    # note = Note.new(note_params)
    # if note.save
    #   head :ok
    # end
    note = Note.new(user_id: session[:user_id], prompt_id: params[:prompt_id], content: params[:content])
    if note.valid?
      note.save
      head :ok
    end
  end

end
