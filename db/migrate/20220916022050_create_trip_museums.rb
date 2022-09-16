class CreateTripMuseums < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_museums do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :museum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
