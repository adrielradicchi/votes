json.extract! survey_response_user, :id, :session_id, :user_id, :survey_response, :survey_question, :created_at, :updated_at
json.url survey_response_user_url(survey_response_user, format: :json)
