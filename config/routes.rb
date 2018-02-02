Rails.application.routes.draw do
  resources :registers, except: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
root "pages#home"

get 'register', to: 'registers#new'

get "pages/about", to: 'pages#about'

get "pages/speakers", to: 'pages#speakers'

get "pages/registers", to: 'pages#registers'

  resources :articles

get 'signup', to:'users#new'
resources :users, except: [:new]

get 'login', to: 'session#new'
post 'login', to: 'session#create'

delete 'logout', to: 'session#destroy'
end
