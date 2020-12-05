Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get '/home/about' => 'homes#about', as: 'about'
  post 'follow/:id' => 'relationships#create', as: 'follow'
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  resources :users, only: [:show,:index,:edit,:update,:follow] do
    get :following_user, on: :member
    get :follower_user, on: :member
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get '/search' => 'search#search'
end
