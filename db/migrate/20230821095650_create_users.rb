class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :phone_number
      t.string :role
      t.string :username
      t.timestamps
    end
  end
end
