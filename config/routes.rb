Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  resources :blog_posts, :post_comments, :users
  resources :users do
    member do
      get :show_grants
      patch :set_grants
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'blog_posts#index'
end
