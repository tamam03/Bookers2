Rails.application.routes.draw do

  root to:"homes#top"

  # メソッド'URL' => 'こんとろーる＃あくしょん'，as:'名前付きルート'
  get 'homes/about' => 'homes#about' ,as:'about'

  devise_for :users

  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
