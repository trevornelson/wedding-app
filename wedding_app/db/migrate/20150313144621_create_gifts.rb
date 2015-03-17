class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string    :title, null: false
      t.string    :category, null: false
      t.string    :url, null: true
      t.boolean   :purchased, default: false

      t.timestamps
    end
  end
end
