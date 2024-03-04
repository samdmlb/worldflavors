class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :servings
      t.integer :xp
      t.string :difficulty
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
