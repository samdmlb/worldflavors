class AddPrepTimeToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :prep_time, :integer
  end
end
