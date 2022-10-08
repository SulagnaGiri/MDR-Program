class StoresController < ApplicationController
  layout "store"
  

  def index
    @stores=Store.all
  end

  def show
    @store=Store.find(params[:id])
    
    @store_transactions = @store.store_transactions
    # @daily_reports =  @store.eager_load(:store_transactions).order(id: :desc).select(" store_transaction.name,store_transaction.card_issuer ")
   
    

  end

  def new
    @store=Store.new
  end

  def create
    @store=Store.new(store_params)
    if @store.save
      flash[:notice]="Store created successfully"
      redirect_to(stores_path)
    else
      render('new')
    end
  end

  def edit
    @store=Store.find(params[:id])

  end

  def update
    @store=Store.find(params[:id])
    
    if @store.update_attributes(store_params)
      flash[:notice]="Store updated successfully"
      redirect_to(stores_path)
    else 
      render('edit')
    end
  end

  def delete
    @store=Store.find(params[:id])
  end

  def destroy
    @store=Store.find(params[:id])
    @store.destroy
    flash[:notice]="Store'#{@store.store_name}' deleted successfully"
    redirect_to(stores_path)
  end
  def daily_report
    @store=Store.find(params[:id])
    @daily_reports=  @store.store_transactions.joins(:store).select("card_type ","name","card_colour","amount","date","store_name","tid","txn_id","store_id")
    respond_to do |format|
      format.html
      format.csv {send_data @daily_reports.to_csv  }
    end
  end
  

  private

  def store_params
    params.require(:store).permit(:store_name,:city)
  end
end
