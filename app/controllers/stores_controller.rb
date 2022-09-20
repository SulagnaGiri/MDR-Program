class StoresController < ApplicationController
  layout "user"
  def index
    @stores=Store.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
