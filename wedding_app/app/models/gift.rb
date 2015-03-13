class Gift < ActiveRecord::Base
  scope :purchased, -> { where(purchased: true) }
  scope :not_purchased, -> { where(purchased: false) }

  validates_presence_of :title,
                        :category,
                        :image_url

  def mark_as_purchased
    purchased = true
    return purchased
  end
end
