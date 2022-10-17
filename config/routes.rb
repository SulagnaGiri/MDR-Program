 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # get 'stores/index'
  # get 'stores/show'
  # get 'stores/new'
  # get 'stores/edit'
  # get 'stores/daily_report'
  devise_for :admin_users
  devise_scope :admin_user do
    root 'devise/sessions#new'
  end
  resources :stores do
    member do
      post :daily_report,:monthly_report
      get :delete, :daily_report ,:monthly_report, :yearly_report
      
    end  
  end
  # get 'csv_transaction_details', to: 'csv_transaction_details#new'
  # post 'csv_transaction_details', to: 'csv_transaction_details#create'
   resources  :store_transactions do

    collection {post :import}
    
    end
 

end
