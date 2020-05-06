class CreateQuestions < ActiveRecord::Migration[4.2]
    def change
      create_table :questions do |t|
        t.string :question
        t.string :answer
        t.string :hint
      end
    end
end