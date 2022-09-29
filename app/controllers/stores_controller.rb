class StoresController < ApplicationController
  layout "store"
  

  def index
    @stores=Store.all
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

  

  private

  def store_params
    params.require(:store).permit(:store_name,:city,:tid, :pos)
  end
end
