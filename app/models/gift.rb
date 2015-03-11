class Gift < ActiveRecord::Base

  validates_presence_of :title,
                        :category,
                        :image_url

  validates :purchased, inclusion: { in: [true, false] }
end
