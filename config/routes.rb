 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :admin_users

 
  get 'csv_transaction_details', to: 'csv_transaction_details#new'
  post 'csv_transaction_details', to: 'csv_transaction_details#create'
 
end
