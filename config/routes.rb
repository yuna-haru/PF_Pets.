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
      resources :bookmarks, only: [:create, :index, :destroy]
      collection do
        get 'keyword'
      end
    end
    resources :users, only: [:index, :show, :edit, :update]
    resources :comments, only: [:create, :destroy]
  end

  namespace :admin do
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
