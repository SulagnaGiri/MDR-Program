class StoreTransactionsController < ApplicationController

    def index
        @storetransaction = StoreTransaction.all
    end

    def import
        StoreTransaction.import(params[:file])
        redirect_to stores_path, notice: "CSV File  Added Successfully"
                 
    end
    
end
