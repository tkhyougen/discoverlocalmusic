Rails.application.routes.draw do

  devise_scope :user do
    root "devise/registrations#new"
  end


  devise_for :users, controllers: {
    registrations: "devise/registrations",
    sessions: "devise/sessions",
  }

  #usersのshow indexへのルーティングを追加する。deviseにはないため
  resources :users, only: [:show,:index]
end
