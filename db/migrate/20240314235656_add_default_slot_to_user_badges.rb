class AddDefaultSlotToUserBadges < ActiveRecord::Migration[7.0]
  def change
    change_column :user_badges, :slot, :integer, default: 0
  end
end
