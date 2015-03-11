class Note < ActiveRecord::Base

  validates_presence_of :prompt_id,
                        :content,
                        :user_id
end
