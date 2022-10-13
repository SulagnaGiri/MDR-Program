class StoresController < ApplicationController
  layout "store"
  

  def index
    @stores=Store.sorted
  end

  def show
    @store=Store.find(params[:id])
    
    @store_transactions = @store.store_transactions   
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
    @date = params[:d_a_t_e]
    @daily_reports=  @store.store_transactions.joins(:store).order(date: :desc).select("card_type ","name","card_colour","amount","date","store_name","tid","txn_id","store_id").where("DATE(date) = ?", @date)
    @daily_sum =  @daily_reports.sum(:amount)
  
    respond_to do |format|
      format.html
      format.csv {send_data  to_csv(@daily_reports)  , filename: "daily report-#{Date.today}.csv"}
    end
  end
  def monthly_report
    @store=Store.find(params[:id])
    @month=params[:month]
    @store_types="others"
    @monthly_reports=  @store.store_transactions.joins(:store).select("date","store_name","tid","status","card_type","card_network","amount","CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD') THEN 2.00 WHEN card_type='Debit' AND amount<2000 
    AND (card_network='VISA'OR card_network='MASTERCARD')THEN 0.45 WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN 0.95 ELSE  0.00  END AS store_mdr",
    "CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD')
    THEN ((amount*2.00)/100) WHEN card_type='Debit' AND amount<2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.45)/100)
    WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.95)/100) ELSE ((amount*0.00)/100) END AS new_amount",
    "CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD')
    THEN ((amount*2.00*18)/(100*100)) WHEN card_type='Debit' AND amount<2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.45*18)/(100*100))
    WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.95*18)/(100*100)) ELSE ((amount*0.00*18)/(100*100)) END AS gst_amount",
    "CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD')
    THEN (amount-((amount*2.00)/100)-((amount*2.00*18)/(100*100))) WHEN card_type='Debit' AND amount<2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN (amount-((amount*0.45)/100)-((amount*0.45*18)/(100*100)))
    WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN (amount-((amount*0.95)/100)-((amount*0.95*18)/(100*100))) ELSE (amount-((amount*0.00)/100)-((amount*0.00*18)/(100*100))) END AS total_amount",
    "acquirer").where("to_char(date, 'YYYY-MM')=?",@month)
    @amount_sum  = @monthly_reports.sum(:amount)
    @new_amount  = @monthly_reports.sum(:"CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD')
    THEN ((amount*2.00)/100) WHEN card_type='Debit' AND amount<2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.45)/100)
    WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.95)/100) ELSE ((amount*0.00)/100) END ")
    @gst= @monthly_reports.sum(:"CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD')
    THEN ((amount*2.00*18)/(100*100)) WHEN card_type='Debit' AND amount<2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.45*18)/(100*100))
    WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN ((amount*0.95*18)/(100*100)) ELSE ((amount*0.00*18)/(100*100)) END ")
    @payable_amount= @monthly_reports.sum(:"CASE WHEN card_type='Credit' AND (card_network='VISA'OR card_network='MASTERCARD')
    THEN (amount-((amount*2.00)/100)-((amount*2.00*18)/(100*100))) WHEN card_type='Debit' AND amount<2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN (amount-((amount*0.45)/100)-((amount*0.45*18)/(100*100)))
    WHEN card_type='Debit' AND amount>2000 AND (card_network='VISA'OR card_network='MASTERCARD') THEN (amount-((amount*0.95)/100)-((amount*0.95*18)/(100*100))) ELSE (amount-((amount*0.00)/100)-((amount*0.00*18)/(100*100))) END" )
    respond_to do |format|
      format.html
      format.csv {send_data  as_csv(@monthly_reports)  , filename: "monthly report-#{Date.today}.csv"}
    end

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
    # attributes = %w{  "Store Name"  "TID"  "Store ID"  txn_id  name card_type  card_colour  amount  date }
   

    CSV.generate(headers: true) do |csv|
        csv <<[ "Store ID", "Store Name" , "TID" , "Txn ID", "Name", "Card Type", "Card colour", "Amount", "Date"]

        daily_reports.each do |daily_report|

            csv<<[
            daily_report.store_id,
            daily_report.store_name,
            # store.city,
            daily_report.tid,
            daily_report.txn_id,
            daily_report.name,
            daily_report.card_type,
            daily_report.card_colour,
            daily_report. amount,
            daily_report.date
          
          ]
        end
      end
  end
<<<<<<< HEAD
  # def to_csv (monthly_reports)
  #   # attributes = %w{  "Date","Store Name", "TID#",  "Status", "Card Type", "Brand Type", "Amount", "Store MDR", "Amount", "Acquring Bank" }
   

  #   CSV.generate(headers: true) do |csv|
  #       csv <<["Date","Store Name", "TID#",  "Status", "Card Type", "Brand Type", "Amount", "Store MDR", "Amount", "Acquring Bank"]

  #       monthly_reports.all.each do |monthly_report|

  #           csv<<[
  #             monthly_report.date,
  #             monthly_report.store_name,
  #             monthly_report.tid,
  #             monthly_report.status,
  #             monthly_report.card_type,
  #             monthly_report.card_network,
  #             monthly_report.amount,
  #             monthly_report.store_mdr,
  #             monthly_report.new_amount,
  #             monthly_report.acquirer,
=======
  def as_csv (monthly_reports)
    # attributes = %w{  "Date","Store Name", "TID#",  "Status", "Card Type", "Brand Type", "Amount", "Store MDR", "Amount", "Acquring Bank" }
   

    CSV.generate(headers: true) do |csv|
        csv <<["Date","Store Name", "TID#",  "Status", "Card Type", "Brand Type", "Amount", "Store MDR", "Amount","GST","Store Payable", "Acquring Bank"]

        monthly_reports.each do |monthly_report|

            csv<<[
              monthly_report.date,
              monthly_report.store_name,
              monthly_report.tid,
              monthly_report.status,
              monthly_report.card_type,
              monthly_report.card_network,
              monthly_report.amount,
              monthly_report.store_mdr,
              monthly_report.new_amount,
              monthly_report.gst_amount,
              monthly_report.total_amount,
              monthly_report.acquirer
>>>>>>> 811bc797a1a2e9604daad136ddaee5b38ddb4695

            
          
  #         ]
  #       end
  #     end
      
<<<<<<< HEAD
  # end

=======
  end
  
>>>>>>> 811bc797a1a2e9604daad136ddaee5b38ddb4695
  
end
