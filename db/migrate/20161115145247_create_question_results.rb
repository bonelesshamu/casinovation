class CreateQuestionResults < ActiveRecord::Migration
  def change
    create_table :question_results do |t|
      t.boolean :already_shown_question1_flag, default: false
      t.boolean :already_shown_question2_flag, default: false
      t.boolean :already_shown_question3_flag, default: false
      t.boolean :already_shown_question4_flag, default: false
      t.boolean :already_shown_question5_flag, default: false
    end
  end
end
