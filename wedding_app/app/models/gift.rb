class Gift < ActiveRecord::Base
  # I like scopes...  know also that you can use a class method to do the same thing
  # def self.purchased
  #   where(purchased: true)
  # end
  #
  scope :purchased,     -> { where(purchased: true) }
  scope :not_purchased, -> { where(purchased: false) }


  has_attached_file :gift_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment :gift_img, :presence => true,
                        :content_type => {:content_type => /\Aimage\/.*\Z/}

  validates_presence_of :title,
                        :category

  def mark_as_purchased
    # This os not going to update the status in the database.  You need to do
    # self.update(purchased: true)
    #
    purchased = true
    return purchased
  end
end
