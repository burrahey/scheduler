Rails.application.routes.draw do
  root to: "schedules#home"
  devise_for :employees, :controllers => { :omniauth_callbacks => "employees/omniauth_callbacks", :registrations => 'employees/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :employees do
      resources :shifts
    end
  end
  resources :schedules
  post '/schedules/:id/publish', to: 'schedules#publish', as: 'publish'
  post '/admin/employees/associates', to: 'admin/employees#associates'

end
