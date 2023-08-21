class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.date :hour
      t.integer :price
      t.text :comment
      t.boolean :acceptation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
