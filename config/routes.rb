Rails.application.routes.draw do
  devise_for :customers
  devise_for :photographers

  root to: 'application#index'

  resources :contracts do
    collection do
      get 'search'
    end
  end
end
