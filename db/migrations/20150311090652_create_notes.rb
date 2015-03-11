class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer   :prompt_id, null: false
      t.integer   :user_id, null: false
      t.text      :content, null: false

      t.timestamps
    end
  end
end
