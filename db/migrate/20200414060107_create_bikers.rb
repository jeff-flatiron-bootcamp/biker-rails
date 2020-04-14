class CreateBikers < ActiveRecord::Migration[6.0]
  def change
    create_table :bikers do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :home_city

      t.timestamps
    end
  end
end
