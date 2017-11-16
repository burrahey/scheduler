Rails.application.routes.draw do
  root to: "welcome#home"
  devise_for :employees, :controllers => { :omniauth_callbacks => "employees/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :employees do
    resources :employees
  end
end
