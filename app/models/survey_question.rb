class SurveyQuestion < ApplicationRecord
  belongs_to :survey
  has_many :survey_response_users
end
