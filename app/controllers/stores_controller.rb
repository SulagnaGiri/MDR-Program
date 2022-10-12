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
    @daily_reports=  @store.store_transactions.joins(:store).order(date: :desc).select("card_type ","name","card_colour","amount","date","store_name","tid","txn_id","store_id")
    @daily_sum =  @daily_reports.sum(:amount)
    respond_to do |format|
      format.html
      format.csv {send_data  to_csv(@daily_reports)  , filename: "daily report-#{Date.today}.csv"}
    end
  end
  def monthly_report
    @store=Store.find(params[:id])
    @monthly_reports=  @store.store_transactions.joins(:store).select("card_type ","name","card_colour","amount","date","store_name","tid","txn_id","store_id")
    @amount_sum  = @monthly_reports.sum(:amount)


  end
  def yearly_report
    @store=Store.find(params[:id])
    @yearly_reports=  @store.store_transactions.joins(:store).select("card_type ","name","card_colour","amount","date","store_name","tid","txn_id","store_id")
    @amount_sum  =  @yearly_reports.sum(:amount)

  end
  

  private

  def store_params
    params.require(:store).permit(:store_name,:city)
  end


  def to_csv (daily_reports)
    attributes = %w{  store_name  tid  store_id  txn_id  name card_type  card_colour  amount  date }
   

    CSV.generate(headers: true) do |csv|
        csv <<attributes

        daily_reports.all.each do |daily_report|

            csv<<[
            daily_report.store_name,
            # store.city,
            daily_report.tid,
            daily_report.store_id,
            daily_report.txn_id,
            daily_report.name,
            daily_report.card_type,
            daily_report.card_colour,
            daily_report. amount,
            daily_report.date,
          
          ]
        end
      end
  end

  
end
