Rails.application.routes.draw do
  root to: "schedules#home"
  devise_for :employees, :controllers => { :omniauth_callbacks => "employees/omniauth_callbacks", :registrations => 'employees/registrations', :sessions => 'employees/sessions'  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/shifts', to: 'shifts#index'
  post '/search', to: 'shifts#search'

  namespace :supervisor do
    resources :employees do
      resources :shifts, only: [:index, :new, :create]
    end
  end
  resources :schedules
  resources :shifts, except: :show

  post '/schedules/:id/publish', to: 'schedules#publish', as: 'publish'
  post '/supervisor/employees/associates', to: 'supervisor/employees#associates'
end
