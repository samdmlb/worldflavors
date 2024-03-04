class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.integer :order_number
      t.text :instruction
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
