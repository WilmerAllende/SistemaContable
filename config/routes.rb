Rails.application.routes.draw do
  get 'balances/index'

  resources :mayor_general, only: [:index]

  root 'home#index'

  resources :accounts do
  	collection do
  		get :autocomplete
  	end
  end

  resources :movements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
