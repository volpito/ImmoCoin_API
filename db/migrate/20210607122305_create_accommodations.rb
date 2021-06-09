class CreateAccommodations < ActiveRecord::Migration[6.1]
  def change
    create_table :accommodations do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.belongs_to :user, index: true
      t.string :user_email

      t.timestamps
    end
  end
end
