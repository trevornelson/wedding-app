class Gift < ActiveRecord::Base

  validates_presence_of :title,
                        :category,
                        :image_url

  validates_inclusion_of :purchased
end
