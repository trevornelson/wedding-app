class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer   :user_id, null: false
      t.string    :name, null: false
      t.string    :artist, null: false
      t.string    :url, null: true

      t.timestamps
    end
  end
end
