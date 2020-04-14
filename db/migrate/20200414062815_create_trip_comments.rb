class CreateTripComments < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_comments do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :biker, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
