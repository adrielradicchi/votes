class SurveyResponse < ApplicationRecord
  belongs_to :survey
  belongs_to :survey_question
  has_many :survey_response_users
end
