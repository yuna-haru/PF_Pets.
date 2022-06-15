Rails.application.routes.draw do

  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
    get 'public/sign_out', to: 'public/sessions#destroy'
  end

  devise_scope :admin do
    get 'admin/sign_out', to: 'admin/sessions#destroy'
  end



  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :public do
    # get '/' => 'homes#top'
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
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get :post_images
      end
    end
    resources :post_images, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :show, :destroy]
  end

  root to: 'public/homes#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
