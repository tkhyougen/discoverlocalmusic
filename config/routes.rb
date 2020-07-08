Rails.application.routes.draw do

  get 'localartists/index'
  get 'localartists/show'
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

#localaritstへのルート
  resources :localartists do
    collection do
      post :confirm
    end
    resources :comments    #localaritstに対する一言コメントをネスト
  end

#localspotへのルート
  resources :spots do
    collection do
      post :confirm
    end
      resources :spotcomments    #spotに対する一言コメントをネスト
  end

  #favrotiesのビュー
  resources :favorites, only:[:create, :destroy, :index]

  #中間テーブルuser_country_labellingsのcreateとdestroyを有効か
  resources :user_country_labellings, only: [:create, :destroy]
end
