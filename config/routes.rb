Rails.application.routes.draw do
  get 'static_pages/display'

  devise_for :users
  resources :posts do
    member do
      get "like", to: "posts#like"
      get "dislike", to: "posts#dislike"
    end
    resources :comments
  end

  get "display", to: "static_pages#display"

  root "posts#index"
end
