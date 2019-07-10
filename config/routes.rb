Rails.application.routes.draw do

  devise_for :users

  root 'products#index'

  get '/missing_products' => 'products#missing'

  get '/export' => 'products#export_json'
  get '/import' => 'products#import_csv'
  post '/import' => 'products#import_csv'
  get '/import_modal' => 'products#import_modal'

  resources :products

  resources :clients

  resources :orders

  get '/sprzedaz_detaliczna' => 'orders#choose_client_for_order'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
