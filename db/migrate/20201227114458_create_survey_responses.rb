class CreateSurveyResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_responses, id: :uuid do |t|
      t.string :response
      t.references :surveys, null: false, foreign_key: true, type: :uuid
      t.references :survey_questions, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
