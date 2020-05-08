class CreateTacos < ActiveRecord::Migration[5.0]
  def change
    create_table(:tacos) do |t|
      t.integer :user_id
      t.integer :order_number
    end 
  end
end
