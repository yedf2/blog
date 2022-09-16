class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :date
      t.integer :multi_city

      t.timestamps
    end
  end
end
