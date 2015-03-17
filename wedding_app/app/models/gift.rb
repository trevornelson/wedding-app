class Gift < ActiveRecord::Base
  scope :purchased, -> { where(purchased: true) }
  scope :not_purchased, -> { where(purchased: false) }

  has_attached_file :gift_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment :gift_img, :presence => true,
                        :content_type => {:content_type => /\Aimage\/.*\Z/}

  validates_presence_of :title,
                        :category

  def mark_as_purchased
    # This os not going to update the status in the database.  You need to do
    # self.purchased = true
    # self.save
    #
    purchased = true
    return purchased
  end
end
