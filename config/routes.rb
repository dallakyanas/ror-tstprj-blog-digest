Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :users

  resources :users do
    member do
      get :show_grants
      patch :set_grants
    end
  end

  resources :blog_posts do
    resources :post_comments
  end


  root 'blog_posts#index'
end
