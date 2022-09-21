class StoresController < ApplicationController
  layout "user"
  def index
    @stores=Store.all
  end

  def show
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
  end

  def updated
  end

  def delete
    @store=Store.find(params[:id])
  end

  def destroy
    @store=Store.find(params[:id])
    @store.destroy
    flash[:notice]="Store'#{@store.name}' deleted successfully"
    redirect_to(stores_path)
  end
  private

  def store_params
    params.require(:store).permit(:store_name,:city,:tid, :pos)
  end
end
