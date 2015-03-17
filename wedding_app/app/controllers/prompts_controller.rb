class PromptsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @prompts = Prompt.all
    render partial: "index"
  end

end
