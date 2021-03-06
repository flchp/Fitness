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
        post :activate
        post :return
      end
     end

    resources :articles do
      member do
        post :publish
        post :hide
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
    member do
      post :add_quantity
      post :remove_quantity
    end
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

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
    member do
      post :join
      post :quit
      post :upvote
    end
    collection do
      get :clubuser
    end
    resources :club_reviews
  end

  resources :articles do
    resources :article_reviews
    member do
      post :join
      post :quit
    end
  end



end
