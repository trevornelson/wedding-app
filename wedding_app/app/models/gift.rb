class Gift < ActiveRecord::Base
  scope :purchased, -> { where(purchased: true) }
  scope :not_purchased, -> { where(purchased: false) }

  has_attached_file :gift_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment :gift_img, :presence => true,
                        :content_type => {:content_type => /\Aimage\/.*\Z/}

  validates_presence_of :title,
                        :category

  def mark_as_purchased
    purchased = true
    return purchased
  end
end
