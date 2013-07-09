class ProductsController < ApplicationController
  
  before_filter :get_product_by_id, only: [:show,:edit,:destroy,:update]

  def get_product_by_id
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product, notice: "Save process completed!"
    else
      flash.now[:notice]="Save proccess coudn't be completed!"
      render :new
    end
  end

  def edit
  end

  def update
     if @product.update_attributes(params[:product])
      redirect_to @product, notice: "Update process completed!"
    else 
      render :edit, notice: "Update proccess coudn't be completed!"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end
end
