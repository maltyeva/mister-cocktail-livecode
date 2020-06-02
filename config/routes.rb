Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :create, :new, :destroy] do
    resources :doses, only: [:new, :create]
    collection do
      get 'filter'
    end
  end

  resources :doses,only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
