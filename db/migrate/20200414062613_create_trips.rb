class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.references :biker, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.string :name
      t.string :start_city
      t.string :dest_city
      t.string :distance_miles
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
