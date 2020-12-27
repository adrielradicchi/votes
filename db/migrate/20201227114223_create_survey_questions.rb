class CreateSurveyQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_questions, id: :uuid do |t|
      t.string :question
      t.references :surveys, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
