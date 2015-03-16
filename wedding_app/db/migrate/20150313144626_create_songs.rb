class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer   :user_id
      t.string    :name, null: false
      t.string    :artist, null: false
      t.string    :url

      t.timestamps
    end
  end
end
