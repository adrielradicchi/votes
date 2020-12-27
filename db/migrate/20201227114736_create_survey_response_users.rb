class CreateSurveyResponseUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_response_users, id: :uuid do |t|
      t.string :session_id
      t.string :user_id
      t.references :survey, null: false, foreign_key: true, type: :uuid
      t.references :survey_response, null: false, foreign_key: true, type: :uuid
      t.references :survey_question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :survey_response_users, :user_id
    add_index :survey_response_users, :session_id
  end
end
