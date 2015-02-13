class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :party_size
      t.date :date
      t.integer :time
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
