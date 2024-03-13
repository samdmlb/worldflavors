class AddIconToBadges < ActiveRecord::Migration[7.0]
  def change
    add_column :badges, :icon, :string
  end
end
