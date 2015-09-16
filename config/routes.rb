
Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do

      resources :students, only: [:show]
      resources :tutors, only: [:show]
      resources :school_years, only: [:index]
      resources :users, only: [:index]

    end
  end

  get '*unmatched_route', to: 'application#invalid_request'
end