class CsvTransactionDetailsController < ApplicationController

    def index
        @csvtransactiondetail = CsvTransactionDetail.all
    end

    def import
        CsvTransactionDetail.import(params[:file])
        redirect_to csv_transaction_details_path, notice: "CSV File  Added Successfully"
    end
    
    


end
