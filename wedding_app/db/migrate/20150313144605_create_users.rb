class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :status, default: 'NoResponse'
      t.string    :username, null: false
      t.string    :password_digest, null: false
      t.string    :name, null: false
      t.string    :street_address
      t.string    :city
      t.string    :state
      t.string    :zip_code
      t.boolean   :invited_plus_one, default: false
      t.integer   :number_in_party, default: 1

      t.timestamps
    end
  end
end
