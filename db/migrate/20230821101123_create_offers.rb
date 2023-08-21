class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.date :availability
      t.integer :pricing
      t.string :social_media
      t.string :style
      t.integer :age
      t.integer :phone_number
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
