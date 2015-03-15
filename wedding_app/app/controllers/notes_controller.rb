class NotesController < ApplicationController

  def create
    note = Note.new(user_id: session[:user_id], prompt_id: params[:prompt_id], content: params[:content])
    if note.valid?
      note.save
      head :ok
    end
  end

end
