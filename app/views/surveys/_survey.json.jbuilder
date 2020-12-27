json.extract! survey, :id, :tittle, :begin_datetime, :end_datetime, :status, :created_at, :updated_at
json.url survey_url(survey, format: :json)
