class SurveyResponseUser < ApplicationRecord
    belongs_to :survey
    belongs_to :survey_question
    belongs_to :survey_response
end
