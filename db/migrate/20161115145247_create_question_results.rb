class CreateQuestionResults < ActiveRecord::Migration
  def change
    create_table :question_results do |t|
      t.integer :answer1, default: 0
      t.integer :answer2, default: 0
      t.integer :answer3, default: 0
      t.integer :answer4, default: 0
      t.integer :answer5, default: 0
    end
  end
end
