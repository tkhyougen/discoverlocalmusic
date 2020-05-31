Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # root "users#index"

  #usersのshow indexへのルーティングを追加する。deviseにはないため
  resources :users, only: [:show,:index]

  devise_scope :user do
    root "users/registrations#new"
  end




  #中間テーブルuser_country_labellingsのcreateとdestroyを有効か
  resources :user_country_labellings, only: [:create, :destroy]
end
