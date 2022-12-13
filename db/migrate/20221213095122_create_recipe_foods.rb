class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.string :quantity
      t.belongs_to :food
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
