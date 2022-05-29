Rails.application.routes.draw do

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :public do
    get '/' => 'homes#top'
    get 'about' => 'homes#about', as:'about'
    patch 'users/withdraw' => 'users#withdraw'
    get 'users/confirm' => 'users#confirm'
    resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      collection do
        get 'keyword'
      end
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :bookmarks, only: [:create, :index, :destroy]
    get '/post_image/hashtag/:hashtag' => 'post_images#hashtag'

  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_images, only: [:index, :show, :destroy] do
      member do
        get :index_user
      end
    end
    resources :comments, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
