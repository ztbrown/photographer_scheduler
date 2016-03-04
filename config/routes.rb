Rails.application.routes.draw do
  devise_for :users, :path_names => {:sign_up => "sign_up/:role"}, controllers: {registrations: "registrations"}

  root to: 'application#index'

  resources :contracts do
    collection do
      get 'search'
    end
  end
end
