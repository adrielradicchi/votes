class Survey < ApplicationRecord
    has_many :survey_question
    has_many :survey_request
    has_many :survey_response_user
end
