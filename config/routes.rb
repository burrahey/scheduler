Rails.application.routes.draw do
  root to: "welcome#home"
  devise_for :employees, :controllers => { :omniauth_callbacks => "employees/omniauth_callbacks", :registrations => 'employees/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :employees do
      resources :shifts, only: [:new, :create, :update, :edit, :delete, :show]
    end
  end

end
