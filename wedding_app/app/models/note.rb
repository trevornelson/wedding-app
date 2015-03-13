class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt

  validates_presence_of :prompt_id,
                        :content,
                        :user_id
end
