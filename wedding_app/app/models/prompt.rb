class Prompt < ActiveRecord::Base

  has_many :notes

  validates_presence_of :content
end

