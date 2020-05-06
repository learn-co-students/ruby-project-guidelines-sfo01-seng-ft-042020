class CreatePlays < ActiveRecord::Migration[4.2]
    def change
      create_table :plays do |t|
        t.integer :user_id
        t.integer :question_id
        t.boolean :correct_answer
      end
    end
end