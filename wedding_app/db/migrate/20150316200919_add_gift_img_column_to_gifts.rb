class AddGiftImgColumnToGifts < ActiveRecord::Migration
  def change
    add_attachment :gifts, :gift_img
  end
end
