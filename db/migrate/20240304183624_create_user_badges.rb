class CreateUserBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_badges do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :selected

      t.timestamps
    end
  end
end
