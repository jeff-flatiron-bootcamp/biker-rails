class AddPasswordDigestToBikers < ActiveRecord::Migration[6.0]
  def change
    add_column :bikers, :password_digest, :string
  end
end
