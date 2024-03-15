class AddSlotToUserBadges < ActiveRecord::Migration[7.0]
  def change
    add_column :user_badges, :slot, :integer
  end
end
