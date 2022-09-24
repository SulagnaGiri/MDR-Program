 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # get 'stores/index'
  # get 'stores/show'
  # get 'stores/new'
  # get 'stores/edit'
  # get 'stores/delete'
  devise_for :admin_users
  devise_scope :admin_user do
    root 'devise/sessions#new'
  end
  resources :stores do
   

    member do
     get :delete
     end  
  end
  # get 'csv_transaction_details', to: 'csv_transaction_details#new'
  # post 'csv_transaction_details', to: 'csv_transaction_details#create'
   resources  :csv_transaction_details do

    collection {post :import}
    
    end
 

end
