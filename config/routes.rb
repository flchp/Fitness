Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :categories
    resources :products do
      member do
        patch :move_up
        patch :move_down
        post :hide
        post :publish
      end
    end

    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
     end
  end

  resources :products do
    resources :comments
    member do
      post :add_to_cart
      post :pay_now
      post :collect
      post :un_collect
    end
    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :remove_quantity
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :products
    resources :users
  end

    resources :clubs do
      resources :club_reviews
      member do
        post :upvote
        post :join
        post :quit
      end
      collection do
        get :clubuser
      end

    end  #社群
  
end
