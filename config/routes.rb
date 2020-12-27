Rails.application.routes.draw do
  resources :session, only: [:create, :login, :destroy] do 
    resources :survey_responses
    resources :survey_questions
    resources :surveys
  end 

  resources :session, only: [:generatetoken]
  resources :survey_response_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
