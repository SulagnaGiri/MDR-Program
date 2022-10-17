class ApplicationController < ActionController::Base
   #   protect_from_forgery prepend: true

     before_action :authenticate_admin_user!

    # def after_sign_in_path_for(resource_or_scope)
       
    #     if
    #         #session[:previous_url] || books_path
    #     #    book_path({:id=>params[:book_id]}) 
    #          stores_path
    #     end
    
    # end
    def after_sign_in_path_for(resource)
      stores_path # your path
    end
   
      
    
    
end
