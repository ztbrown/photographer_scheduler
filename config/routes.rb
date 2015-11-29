Rails.application.routes.draw do
  devise_for :photographers

  resources :sessions, :path => '/' do
    collection do
      get 'search'
    end
  end
end
