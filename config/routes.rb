Rails.application.routes.draw do
  get 'home/index'
  get 'home/location_data', :defaults => { :format => 'json' }
  get 'home/language_data', :defaults => { :format => 'json' }
  get 'home/salary_data', :defaults => { :format => 'json' }
  get 'home/age_data', :defaults => { :format => 'json' }

  root to: "home#index"

  resources :responses do
    resources :locations, to: 'locations#create'
    resources :ages, to: 'ages#create'
    resources :response_languages
    resources :response_salaries
  end

end
