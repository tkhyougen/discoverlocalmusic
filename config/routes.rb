Rails.application.routes.draw do

  # devise_scope :user do
  #   root "users/registrations#new"
  # end
  


  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  # registrations: "devise/registrations",
  # sessions: "devise/sessions"

  #usersのshow indexへのルーティングを追加する。deviseにはないため
  resources :users, only: [:show,:index]




  #中間テーブルuser_country_labellingsのcreateとdestroyを有効か
  resources :user_country_labellings, only: [:create, :destroy]
end
