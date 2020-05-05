class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table(:ingredients) do |t|
      t.string :ingredient_name
      t.string :ingredient_type
    end 
  end
end
