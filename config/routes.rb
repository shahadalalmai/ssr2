Rails.application.routes.draw do
  # get 'places/index'
  # get 'places/show'
  # get 'places/new'
  # get 'places/edit'

  resources :places
  resources :favorites
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/places/mine/:id", to: "places#mine", as: "my_list"

  get "/places/favs/index", to: "favorites#index", as:"my_fav"  #http://localhost:3000/places/favs/index/

  get "/places/favs/add/:id", to: "favorites#new", as:"add_fav"

  #This is to redefine the default routes and give it the new naming and routing with our new devise named users
  devise_for :users, controllers: { registrations: 'users/registrations',
    sessions: 'users/sessions', unlocks: 'users/unlocks',
    passwords: 'users/passwords', confirmations: 'users/confirmations'}

  root to: "places#index"

end
