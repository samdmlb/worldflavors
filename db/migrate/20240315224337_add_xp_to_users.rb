class AddXpToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :xp, :integer
  end
end
