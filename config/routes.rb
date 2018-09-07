Rails.application.routes.draw do
  resources :transactions
  devise_for :users, controllers: {registrations: 'users/registrations'}

  root to: "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
