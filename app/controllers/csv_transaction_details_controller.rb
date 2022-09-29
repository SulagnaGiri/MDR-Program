class CsvTransactionDetailsController < ApplicationController
    layout "store"

    def index
        @storetransactiondetail = CsvTransactionDetail.all
    end

    def import
      @result=  CsvTransactionDetail.import(params[:file])
      if(@result==="not available") redirect_to new_store_path
      else redirect_to csv_transaction_details_path, notice: "CSV File  Added Successfully"
    end
    
    
z

end
