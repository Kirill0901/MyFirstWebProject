Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root "posts#index"

    get "/users" => "users#index", as: "users"
    get "/create" => "posts#create_post", as: "create"
    get "/posts/:id" => "posts#show"
    get "/edit/:id" => "posts#edit", as: "edit"
    get '/category/create' => "categories#new", as: "create_category"

    patch "posts.:id" => "posts#update", as: :update_post
    patch "categories.:id" => "categories#update", as: :update_category
    get '/:locale.:id' => 'posts#destroy', as: :destroy_post
    get 'users/:id' => 'users#show_user', as: :show_user
    get 'users/:id' => 'users#destroy', as: :destroy_user
    get 'categories/:id' => 'categories#show', as: :show_category
    get 'categories/:id' => 'categories#destroy', as: :destroy_category

    get 'posts/:post_id/comments(.:format)' => 'comment#create', as: :create_comment

    resources :users
    resources :posts do
      resources :comments
    end
    resources :categories
  end
end
