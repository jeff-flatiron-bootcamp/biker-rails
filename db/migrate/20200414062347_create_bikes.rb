class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.references :biker, null: false, foreign_key: true
      t.references :manufacturer, null: false, foreign_key: true
      t.string :bike_name
      t.string :bike_type
      t.boolean :stolen

      t.timestamps
    end
  end
end
