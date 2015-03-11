class Song < ActiveRecord::Base

  validates_presence_of :user_id,
                        :name,
                        :artist
end
