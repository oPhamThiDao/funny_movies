Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions" }
  root "home#index"
  resources :share, only: [:new, :create]
  patch "reaction/:id", to: "share#reaction", as: "reaction_movie"
end
